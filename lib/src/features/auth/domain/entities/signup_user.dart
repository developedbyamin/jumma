class SignUpUserEntity {
  final String name;
  final String email;
  final String phoneNumber;
  final String mosque;
  final String password;
  final bool acceptSubscribe;
  final bool acceptMemberShipAgreement;

  SignUpUserEntity(
    this.acceptSubscribe, {
    required this.acceptMemberShipAgreement,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.mosque,
    required this.password,
  });
}
