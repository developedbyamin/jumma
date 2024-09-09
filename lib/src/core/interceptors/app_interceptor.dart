import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:jumma/src/core/config/constants/api_key.dart';
import 'package:jumma/src/features/auth/data/sources/local/token_store.dart';
import 'package:jumma/src/features/auth/domain/entities/auth_tokens.dart';

class AppInterceptor extends Interceptor {
  Dio? _dio;

  AppInterceptor() {
    _init();
  }

  Future<void> _init() async {
    _dio = Dio();
    _dio?.interceptors.add(this);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    debugPrint("Request: $options");
    AuthTokens? tokens = await TokenStore.getTokens();
    debugPrint("ACCESS TOKEN READ: ${tokens?.accessToken}");

    if (tokens?.accessToken != null) {
      options.headers['Authorization'] = 'Bearer ${tokens!.accessToken}';
    }

    return handler.next(options);
  }

  @override
  void onResponse(Response<dynamic> response, ResponseInterceptorHandler handler) {
    return handler.next(response);
  }

  @override
  Future<void> onError(DioException err, ErrorInterceptorHandler handler) async {
    debugPrint("Error: $err");

    if (err.response?.statusCode == 401) {
      AuthTokens? tokens = await TokenStore.getTokens();
      debugPrint("REFRESH TOKEN READ: ${tokens?.refreshToken}");

      if (tokens?.refreshToken != null) {
        String? newAccessToken = await refreshAccessToken(tokens!.refreshToken);

        if (newAccessToken != null) {
          err.requestOptions.headers['Authorization'] = 'Bearer $newAccessToken';
          return handler.resolve(await _retry(err.requestOptions));
        }
      }
    }

    return handler.next(err);
  }

  Future<Response<dynamic>> _retry(RequestOptions requestOptions) async {
    return _dio!.fetch<dynamic>(requestOptions);
  }

  Future<String?> refreshAccessToken(String refreshToken) async {
    final Dio dio = Dio();
    dio.options.headers['Authorization'] = 'Bearer $refreshToken';

    try {
      final response = await dio.post(ApiKey.baseUrl + ApiKey.refresh);

      if (response.statusCode == 200) {
        debugPrint("Refresh response: ${response.data}");
        String newAccessToken = response.data['accessToken'];
        String newRefreshToken = response.data['refreshToken'];
        AuthTokens tokens = AuthTokens(
          accessToken: newAccessToken,
          refreshToken: newRefreshToken,
        );
        await TokenStore.saveTokens(tokens);
        debugPrint("ACCESS TOKEN SAVED: $newAccessToken");
        return newAccessToken;
      } else {
        debugPrint('Refresh token error: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      debugPrint('Exception during token refresh: $e');
      return null;
    }
  }
}
