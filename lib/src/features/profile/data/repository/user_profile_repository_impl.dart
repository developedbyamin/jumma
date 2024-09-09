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
}
