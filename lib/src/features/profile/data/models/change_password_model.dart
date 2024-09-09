import '../../domain/entities/change_password_entity.dart';

class ChangePasswordModel {
  final String currentPassword;
  final String newPassword;
  final String reNewPassword;

  ChangePasswordModel({
    required this.currentPassword,
    required this.newPassword,
    required this.reNewPassword,
  });

  Map<String, dynamic> toJson() {
    return {
      'currentPassword': currentPassword,
      'newPassword': newPassword,
      'reNewPassword': reNewPassword,
    };
  }

  factory ChangePasswordModel.fromJson(Map<String, dynamic> json) {
    return ChangePasswordModel(
      currentPassword: json['currentPassword'],
      newPassword: json['newPassword'],
      reNewPassword: json['reNewPassword'],
    );
  }
}

extension ChangePasswordEntityToModel on ChangePasswordEntity {
  ChangePasswordModel toModel() {
    return ChangePasswordModel(
      currentPassword: currentPassword,
      newPassword: newPassword,
      reNewPassword: reNewPassword
    );
  }
}