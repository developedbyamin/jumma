import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jumma/service_locator.dart';
import 'package:jumma/src/core/common/bottom_navigation_bar/bloc/bottom_nav_bloc.dart';
import 'package:jumma/src/core/common/bottom_navigation_bar/pages/root.dart';
import 'package:jumma/src/core/common/splash/presentation/pages/splash.dart';
import 'package:jumma/src/core/config/theme/appTheme/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
    statusBarColor: Colors.transparent,
  ));
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<BottomNavBloc>(
          create: (context) => BottomNavBloc(),
        ),
      ],
      child: MaterialApp(
        theme: AppTheme.themeJumma,
        title: 'Jumma',
        debugShowCheckedModeBanner: false,
        home: const SplashPage(),
      ),
    );
  }
}

