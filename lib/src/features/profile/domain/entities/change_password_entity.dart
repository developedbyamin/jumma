class ChangePasswordEntity {
  final String currentPassword;
  final String newPassword;
  final String reNewPassword;

  ChangePasswordEntity(
      {required this.currentPassword,
      required this.newPassword,
      required this.reNewPassword});
}
