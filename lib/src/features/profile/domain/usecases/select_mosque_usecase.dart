import '../../../../core/usecase/usecase.dart';
import '../../../../../service_locator.dart';
import '../repository/user_profile_repository.dart';

class SelectMosqueUsecase extends UseCase<void, int> {
  @override
  Future<void> call({int? params}) async {
    return await sl<UserProfileRepository>().selectMosque(params!);
  }
}
