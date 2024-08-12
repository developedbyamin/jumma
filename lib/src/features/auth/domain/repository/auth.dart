import 'package:dartz/dartz.dart';
import 'package:jumma/src/features/auth/data/models/signup_user.dart';
import '../../data/models/signin_user.dart';

abstract class AuthRepository{
  Future<Either> signUp(SignUpUserModel createUserReq);

  Future<Either> signIn(SignInUserModel signInUserReq);
}