import 'package:jumma/src/features/auth/domain/entities/signin_user.dart';

class SignInUserModel extends SignInUserEntity{
  SignInUserModel({required super.email, required super.password});


  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }

  factory SignInUserModel.fromJson(Map<String, dynamic> json) {
    return SignInUserModel(
      email: json['email'],
      password: json['password'],
    );
  }


}