import 'package:jumma/src/features/profile/domain/entities/user_data_entity.dart';

import '../models/change_password_model.dart';
import '../sources/user_profile_service.dart';
import '../../../../../service_locator.dart';
import '../../domain/repository/user_profile_repository.dart';
import '../../data/models/user_profile_model.dart';

class UserProfileRepositoryImpl extends UserProfileRepository {
  @override
  Future<void> updateUserProfile(UserProfileModel userProfileModel) async =>
      await sl<UserProfileService>().updateUserProfile(userProfileModel);

  @override
  Future<void> changePassword(ChangePasswordModel changePasswordModel) async =>
      await sl<UserProfileService>().changePassword(changePasswordModel);

  @override
  Future<void> deleteUser(String uId) async =>
      await sl<UserProfileService>().deleteUser(uId);

  @override
  Future<void> selectMosque(int mosqueId) async =>
      await sl<UserProfileService>().selectMosque(mosqueId);

  @override
  Future<UserDataEntity> getUserData(String uId) async =>
      await sl<UserProfileService>().getUserData(uId);
}
