import 'dart:developer';
import '../../../../core/network/dio/dio_client.dart';
import '../models/change_password_model.dart';
import '../models/user_profile_model.dart';

abstract class UserProfileService {
  Future<void> updateUserProfile(UserProfileModel userProfileModel);
  Future<void> changePassword(ChangePasswordModel changePasswordModel);
}

class UserProfileServiceImpl implements UserProfileService {
  @override
  Future<void> updateUserProfile(UserProfileModel userProfileModel) async {
    try {
      const url = 'https://jumma.svdev.me/api/Profile/UpdateProfile';

      final response = await clientDio.put(url, data: userProfileModel.toJson());

      if (response.statusCode == 200) {
        log('Profile updated successfully');
      } else {
        final error = response.data['errors']['PhoneNumber']?.first ?? 'Unknown error';
        throw Exception('Failed to update profile: $error');
      }
    } catch (e) {
      throw Exception('$e');
    }
  }
  
  @override
  Future<void> changePassword(ChangePasswordModel changePasswordModel) async {
    try {
      const url = 'https://jumma.svdev.me/api/Profile/UpdatePassword';

      final response = await clientDio.put(url, data: changePasswordModel.toJson());

      if (response.statusCode == 200) {
        log('Password changed successfully');
      } else {
        throw Exception('Failed to update password: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('$e');
    }
  }
}
