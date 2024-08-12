import 'package:dartz/dartz.dart';
import '../../../../../service_locator.dart';
import '../../../../core/usecase/usecase.dart';
import '../../data/models/signin_user.dart';
import '../repository/auth.dart';


class SignInUseCase implements UseCase<Either,SignInUserModel>{
  @override
  Future<Either> call({SignInUserModel? params}) async {
    return sl<AuthRepository>().signIn(params!);
  }
}