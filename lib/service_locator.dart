import 'package:get_it/get_it.dart';
import 'package:jumma/src/features/auth/data/repository/auth_impl.dart';
import 'package:jumma/src/features/auth/data/sources/local/token_store.dart';
import 'package:jumma/src/features/auth/data/sources/remote/auth_service.dart';
import 'package:jumma/src/features/auth/domain/repository/auth.dart';
import 'package:jumma/src/features/auth/domain/usecases/signin_use_case.dart';
import 'package:jumma/src/features/auth/domain/usecases/signup_use_case.dart';
import 'package:jumma/src/features/home/data/repository/prayer_time_repository_impl.dart';
import 'package:jumma/src/features/home/data/sources/local/pray_service.dart';
import 'package:jumma/src/features/home/domain/repository/prayer_time_repository.dart';
import 'package:jumma/src/features/home/domain/usecases/get_prayer_time_use_case.dart';
import 'package:jumma/src/features/home/presentation/viewmodel/fetch_prayer_times_bloc.dart';


final GetIt sl = GetIt.instance;

Future<void> initializeDependencies() async {
  // AUTH SERVICE
  sl.registerSingleton<AuthService>(AuthServiceImpl());

  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());

  sl.registerSingleton<SignUpUseCase>(SignUpUseCase());

  sl.registerSingleton<SignInUseCase>(
    SignInUseCase(),
  );

  // Home
  sl.registerSingleton<PrayerTimeService>(PrayerTimeServiceImpl());

  sl.registerSingleton<PrayerTimeRepository>(PrayerTimeRepositoryImpl());

  sl.registerSingleton<GetPrayerTimeUseCase>(GetPrayerTimeUseCase());

  sl.registerSingleton<FetchPrayerTimesBloc>(FetchPrayerTimesBloc());

}
