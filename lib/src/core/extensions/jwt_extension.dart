import 'package:jwt_decoder/jwt_decoder.dart';

extension JwtExtension on String {
  Map<String, dynamic> decodeJwt() {
    return JwtDecoder.decode(this);
  }

  String getUserEmail() {
    final decodedToken = decodeJwt();
    return decodedToken['email'] ?? 'No Email';
  }

  String getName() {
    final decodedToken = decodeJwt();
    return decodedToken['http://schemas.xmlsoap.org/ws/2005/05/identity/claims/name'] ?? 'No Name';
  }

  String getSurname() {
    final decodedToken = decodeJwt();
    return decodedToken['http://schemas.xmlsoap.org/ws/2005/05/identity/claims/surname'] ?? 'No Name';
  }

  String getPhone() {
    final decodedToken = decodeJwt();
    return decodedToken['http://schemas.xmlsoap.org/ws/2005/05/identity/claims/mobilephone'] ?? 'No Name';
  }

  String getGender() {
    final decodedToken = decodeJwt();
    return decodedToken['http://schemas.xmlsoap.org/ws/2005/05/identity/claims/gender'] ?? 'No Name';
  }

  String getUId() {
    final decodedToken = decodeJwt();
    return decodedToken['http://schemas.xmlsoap.org/ws/2005/05/identity/claims/nameidentifier'] ?? 'No Name';
  }
}
