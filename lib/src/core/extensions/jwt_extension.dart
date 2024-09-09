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
    return decodedToken['name'] ?? 'No Name';
  }

  String getSurname() {
    final decodedToken = decodeJwt();
    return decodedToken['surname'] ?? 'No Name';
  }
}
