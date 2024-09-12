import 'package:jumma/service_locator.dart';
import 'package:jumma/src/core/usecase/usecase.dart';
import 'package:jumma/src/features/profile/domain/entities/user_data_entity.dart';
import 'package:jumma/src/features/profile/domain/repository/user_profile_repository.dart';

class UserDataUsecase extends UseCase<UserDataEntity, String> {
  @override
  Future<UserDataEntity> call({String? params}) {
    return sl<UserProfileRepository>().getUserData(params!);
  }
}
