class UserDataEntity {
  final String email;
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final bool isImam;

  UserDataEntity(
      {required this.firstName,
      required this.lastName,
      required this.phoneNumber,
      required this.isImam,
      required this.email});
}
