import '../../domain/entities/user_profile_entity.dart';

class UserProfileModel {
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String email;

  UserProfileModel(
      {required this.firstName,
      required this.lastName,
      required this.phoneNumber,
      required this.email});

  factory UserProfileModel.fromJson(Map<String, dynamic> json) {
    return UserProfileModel(
      firstName: json['firstName'],
      lastName: json['lastName'],
      phoneNumber: json['phoneNumber'],
      email: json['email'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'phoneNumber': phoneNumber,
      'email': email,
    };
  }
}

extension UserProfileEntityToModel on UserProfileEntity {
  UserProfileModel toModel() {
    return UserProfileModel(
        email: email,
        firstName: firstName,
        lastName: lastName,
        phoneNumber: phoneNumber);
  }
}
