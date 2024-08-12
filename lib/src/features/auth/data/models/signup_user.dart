import '../../domain/entities/signup_user.dart';

class SignUpUserModel extends SignUpUserEntity {
  SignUpUserModel({
    required String name,
    required String email,
    required String phoneNumber,
    required String mosque,
    required String password,
    required bool acceptSubscribe,
    required bool acceptMemberShipAgreement,
  }) : super(
    acceptSubscribe,
    acceptMemberShipAgreement: acceptMemberShipAgreement,
    name: name,
    email: email,
    phoneNumber: phoneNumber,
    mosque: mosque,
    password: password,
  );

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
