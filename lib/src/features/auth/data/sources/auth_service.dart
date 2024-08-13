import 'package:dartz/dartz.dart';
import '../models/signin_user.dart';
import '../models/signup_user.dart';

abstract class AuthService {
  Future<Either> signUp(SignUpUserModel createUserReq);
  Future<Either> signIn(SignInUserModel signInUserReq);
}

class AuthServiceImpl extends AuthService{
  @override
  Future<Either> signIn(SignInUserModel signInUserReq) async{
    try {
      await Future.delayed(const Duration(seconds: 2));
      return const Right('Sign in was succsessful');
    } catch (e) {
      return const Left('message');
    }
  }

  @override
  Future<Either> signUp(SignUpUserModel createUserReq) async {
    try {
      await Future.delayed(const Duration(seconds: 2));
      return const Right('Sign up was succsessful');
    } catch (e) {
      return const Left('message');
    }
  }

}