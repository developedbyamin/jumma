import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jumma/service_locator.dart';
import 'package:jumma/src/core/common/bottom_navigation_bar/bloc/bottom_nav_cubit.dart';
import 'package:jumma/src/core/common/bottom_navigation_bar/pages/root.dart';
import 'package:jumma/src/core/config/theme/appTheme/app_theme.dart';
import 'package:jumma/src/features/home/presentation/viewmodel/fetch_prayer_times_bloc.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
    statusBarColor: Colors.transparent,
  ));
  await initializeDependencies();
  // Workmanager().initialize(callbackDispatcher);
  // Workmanager().registerPeriodicTask(
  //   '1',
  //   'clearCacheTask',
  //   frequency: const Duration(days: 1),
  //   initialDelay: const Duration(seconds: 10),
  //   constraints: Constraints(
  //     networkType: NetworkType.not_required,
  //   ),
  // );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<BottomNavCubit>(
          create: (context) => BottomNavCubit(),
        ),
        BlocProvider<FetchPrayerTimesBloc>(
          create: (context) => FetchPrayerTimesBloc(),
        ),
      ],
      child: MaterialApp(
        theme: AppTheme.themeJumma,
        title: 'Jumma',
        debugShowCheckedModeBanner: false,
        home: const Root(),
      ),
    );
  }
}

// void callbackDispatcher() {
//   Workmanager().executeTask((task, inputData) {
//     clearCacheTask();
//     return Future.value(true);
//   });
// }


