import 'package:dartz/dartz.dart';
import 'package:jumma/src/features/auth/data/models/signup_user.dart';
import '../../../../../service_locator.dart';
import '../../../../core/usecase/usecase.dart';
import '../repository/auth.dart';

class SignUpUseCase implements UseCase<Either,SignUpUserModel>{
  @override
  Future<Either> call({SignUpUserModel? params}) async {
    return sl<AuthRepository>().signUp(params!);
  }
}