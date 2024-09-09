import '../../../../core/usecase/usecase.dart';
import '../../data/models/change_password_model.dart';
import '../../../../../service_locator.dart';
import '../repository/user_profile_repository.dart';

class ChangePasswordUsecase implements UseCase<void, ChangePasswordModel> {
  @override
  Future<void> call({ChangePasswordModel? params}) async {
    return await sl<UserProfileRepository>().changePassword(params!); 
  }
}