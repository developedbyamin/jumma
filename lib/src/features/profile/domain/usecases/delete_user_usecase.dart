import 'package:jumma/src/core/usecase/usecase.dart';
import '../../../../../service_locator.dart';
import '../repository/user_profile_repository.dart';

class DeleteUserUsecase extends UseCase<void, String> {
  @override
  Future<void> call({String? params}) async {
    return await sl<UserProfileRepository>().deleteUser(params!); 
  }
  
}