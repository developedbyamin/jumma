import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:jumma/src/core/config/constants/api_key.dart';
import '../../../../../core/interceptors/app_interceptor.dart';
import '../../../domain/entities/auth_tokens.dart';
import '../../models/signin_user.dart';
import '../../models/signup_user.dart';
import '../local/token_store.dart';

abstract class AuthService {
  Future<Either> signUp(SignUpUserModel createUserReq);
  Future<Either> signIn(SignInUserModel signInUserReq);
  Future<Either> refreshToken(String refreshToken);
  Future<Either> isAuthenticated();
}

class AuthServiceImpl extends AuthService {
  final Dio _dio;

  AuthServiceImpl() : _dio = Dio() {
    _dio.interceptors.add(AppInterceptor());
  }

  @override
  Future<Either> signIn(SignInUserModel signInUserReq) async {
    try {
      var response = await _dio.post(
        ApiKey.login,
        data: signInUserReq.toJson(),
      );
      if (response.statusCode == 200) {

        String accessToken = response.data['accessToken'];
        String refreshToken = response.data['refreshToken'];

        AuthTokens tokens = AuthTokens(
          accessToken: accessToken,
          refreshToken: refreshToken,
        );
        await TokenStore.saveTokens(tokens);

        return const Right('success');
      } else {
        return const Left('message');
      }
    } catch (e) {
      return const Left('message');
    }
  }

  @override
  Future<Either> signUp(SignUpUserModel createUserReq) async {
    try {
      await Future.delayed(const Duration(seconds: 2));
      return const Right('Sign up was succsessful');
    } catch (e) {
      return const Left('message');
    }
  }

  @override
  Future<Either> isAuthenticated() {
    // TODO: implement isAuthenticated
    throw UnimplementedError();
  }

  @override
  Future<Either> refreshToken(String refreshToken) {
    // TODO: implement refreshToken;
    throw UnimplementedError();
  }
}
