import '../../data/models/change_password_model.dart';
import '../../data/models/user_profile_model.dart';

abstract class UserProfileRepository {
  Future<void> updateUserProfile(UserProfileModel userProfileModel);
  Future<void> changePassword(ChangePasswordModel changePasswordModel);
  Future<void> deleteUser(String uId);
  Future<void> selectMosque(int mosqueId);
}