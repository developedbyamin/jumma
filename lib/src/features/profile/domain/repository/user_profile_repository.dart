import '../../data/models/change_password_model.dart';
import '../../data/models/user_profile_model.dart';
import '../entities/user_data_entity.dart';

abstract class UserProfileRepository {
  Future<void> updateUserProfile(UserProfileModel userProfileModel);
  Future<void> changePassword(ChangePasswordModel changePasswordModel);
  Future<void> deleteUser(String uId);
  Future<void> selectMosque(int mosqueId);
  Future<UserDataEntity> getUserData(String uId);
}