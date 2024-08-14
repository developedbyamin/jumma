import '../../domain/entities/signup_user.dart';

class SignUpUserModel {
  final String name;
  final String email;
  final String phoneNumber;
  final String mosque;
  final String password;
  final bool acceptSubscribe;
  final bool acceptMemberShipAgreement;

  SignUpUserModel({
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.mosque,
    required this.password,
    required this.acceptSubscribe,
    required this.acceptMemberShipAgreement,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
      'mosque': mosque,
      'password': password,
      'acceptSubscribe': acceptSubscribe,
      'acceptMemberShipAgreement': acceptMemberShipAgreement,
    };
  }

  factory SignUpUserModel.fromJson(Map<String, dynamic> json) {
    return SignUpUserModel(
      name: json['name'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      mosque: json['mosque'],
      password: json['password'],
      acceptSubscribe: json['acceptSubscribe'],
      acceptMemberShipAgreement: json['acceptMemberShipAgreement'],
    );
  }
}

extension SignUpUserEntityToModel on SignUpUserEntity {
  SignUpUserModel toModel() {
    return SignUpUserModel(
      name: name,
      email: email,
      phoneNumber: phoneNumber,
      mosque: mosque,
      password: password,
      acceptSubscribe: acceptSubscribe,
      acceptMemberShipAgreement: acceptMemberShipAgreement,
    );
  }
}
