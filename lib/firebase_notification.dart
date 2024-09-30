import 'package:firebase_messaging/firebase_messaging.dart';

abstract final class FirebaseNotification {
  static final firebaseMessage = FirebaseMessaging.instance;
  static String? fcmToken;
  static Future<void> initNotification() async {
    await firebaseMessage.requestPermission();
    fcmToken = await firebaseMessage.getToken();
    print('fcmtoken is $fcmToken');
  }
}
