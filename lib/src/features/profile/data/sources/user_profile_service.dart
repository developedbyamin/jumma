import 'dart:developer';
import 'package:dio/dio.dart';
import '../../../../core/config/constants/api_key.dart';
import '../../../../core/interceptors/app_interceptor.dart';
import '../models/change_password_model.dart';
import '../models/user_profile_model.dart';

abstract class UserProfileService {
  Future<void> updateUserProfile(UserProfileModel userProfileModel);
  Future<void> changePassword(ChangePasswordModel changePasswordModel);
  Future<void> deleteUser(String uId);
  Future<void> selectMosque(int mosqueId);
}

class UserProfileServiceImpl implements UserProfileService {
  final Dio _dio;

  UserProfileServiceImpl() : _dio = Dio() {
    _dio.interceptors.add(AppInterceptor());
  }

  @override
  Future<void> updateUserProfile(UserProfileModel userProfileModel) async {
    try {
      final response =
          await _dio.put(ApiKey.updateProfile, data: userProfileModel.toJson());

      if (response.statusCode == 200) {
        log('Profile updated successfully');
      } else {
        throw Exception('Failed to update profile: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('$e');
    }
  }

  @override
  Future<void> changePassword(ChangePasswordModel changePasswordModel) async {
    try {
      final response =
          await _dio.put(ApiKey.changePass, data: changePasswordModel.toJson());

      if (response.statusCode == 200) {
        log('Password changed successfully');
      } else {
        throw Exception('Failed to update password: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('$e');
    }
  }

  @override
  Future<void> deleteUser(String uId) async {
    try {
      final url = 'https://jumma.svdev.me/api/User/$uId';
      final response = await _dio.delete(url);

      if (response.statusCode == 200) {
        log('User deleted successfully');
      } else {
        throw Exception('Failed to delete user: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('$e');
    }
  }

  @override
  Future<void> selectMosque(int mosqueId) async {
    try {
      final body = {"mosqueId": mosqueId};
      final response = await _dio.put(ApiKey.selectMosque, data: body);

      if (response.statusCode == 200) {
        log('Mosque selected successfully');
      } else {
        log('Mosque selected error');
        throw Exception('Failed to selected mosque: ${response.statusCode}');
      }
    } catch (e) {
      log('$e');
      throw Exception('$e');
    }
  }
}
