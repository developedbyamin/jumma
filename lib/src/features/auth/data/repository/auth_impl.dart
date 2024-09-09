import 'package:dartz/dartz.dart';
import 'package:jumma/src/features/auth/data/models/signup_user.dart';
import '../../../../../service_locator.dart';
import '../../domain/repository/auth.dart';
import '../models/signin_user.dart';
import '../sources/remote/auth_service.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<Either> signIn(SignInUserModel signInUserReq) async {
    return await sl<AuthService>().signIn(signInUserReq);
  }

  @override
  Future<Either> signUp(SignUpUserModel createUserReq) async {
    return await sl<AuthService>().signUp(createUserReq);
  }

  @override
  Future<Either> isAuthenticated() {
    // TODO: implement isAuthenticated
    throw UnimplementedError();
  }

  @override
  Future<Either> refreshToken(String refreshToken) {
    // TODO: implement refreshToken
    throw UnimplementedError();
  }
}