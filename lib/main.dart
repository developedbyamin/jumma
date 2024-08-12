import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jumma/src/core/config/theme/appTheme/app_theme.dart';
import 'package:jumma/src/features/splash/presentation/pages/splash.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
    statusBarColor: Colors.transparent,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.themeJumma,
      title: 'Jumma',
      debugShowCheckedModeBanner: false,
      home: SplashPage(),
    );
  }
}

