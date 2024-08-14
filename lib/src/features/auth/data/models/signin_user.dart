import 'package:jumma/src/features/auth/domain/entities/signin_user.dart';

class SignInUserModel{
  final String email;
  final String password;

  SignInUserModel({required this.email, required this.password});


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

extension SignInUserEntityToModel on SignInUserEntity {
  SignInUserModel toModel() {
    return SignInUserModel(
      email: email,
      password: password,
    );
  }
}