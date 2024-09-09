import '../../../../core/usecase/usecase.dart';
import '../../data/models/user_profile_model.dart';
import '../repository/user_profile_repository.dart';
import '../../../../../service_locator.dart';

class UpdateUserProfileUsecase implements UseCase<void, UserProfileModel> {
  @override
  Future<void> call({UserProfileModel? params}) async {
    return await sl<UserProfileRepository>().updateUserProfile(params!);
  }
}