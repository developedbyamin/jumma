import '../../domain/entities/user_data_entity.dart';

class UserDataModel {
  final int id;
  final String firstName;
  final String lastName;
  final String email;
  final String phoneNumber;
  final bool isImam;
  final String registerAt;

  UserDataModel(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.email,
      required this.phoneNumber,
      required this.isImam,
      required this.registerAt});
  
  factory UserDataModel.fromJson(Map<String, dynamic> json) {
    return UserDataModel(
      firstName: json['firstName'],
      lastName: json['lastName'],
      phoneNumber: json['phoneNumber'],
      email: json['email'], 
      id: json['id'], 
      isImam: json['isImam'], 
      registerAt: json['registerAt'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'phoneNumber': phoneNumber,
      'email': email,
      'id': id,
      'isImam': isImam,
      'registerAt': registerAt,
    };
  }
}

extension UserDataModelToEntity on UserDataModel {
  UserDataEntity toEntity() {
    return UserDataEntity(
        firstName: firstName,
        lastName: lastName,
        phoneNumber: phoneNumber, isImam: isImam);
  }
}