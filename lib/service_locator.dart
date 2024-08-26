import 'package:get_it/get_it.dart';
import 'package:jumma/src/features/auth/data/repository/auth_impl.dart';
import 'package:jumma/src/features/auth/data/sources/auth_service.dart';
import 'package:jumma/src/features/auth/domain/repository/auth.dart';
import 'package:jumma/src/features/auth/domain/usecases/signin_use_case.dart';
import 'package:jumma/src/features/auth/domain/usecases/signup_use_case.dart';
import 'package:jumma/src/features/home/data/repository/pray_time_repository_impl.dart';
import 'package:jumma/src/features/home/data/sources/pray_service.dart';
import 'package:jumma/src/features/home/domain/repository/pray_time_repository.dart';
import 'package:jumma/src/features/home/domain/usecases/clear_cache_use_case.dart';
import 'package:jumma/src/features/home/domain/usecases/get_next_prayer_time.dart';
import 'package:jumma/src/features/home/domain/usecases/load_pray_time.dart';
import 'package:jumma/src/features/home/domain/usecases/pray_time_use_case.dart';
import 'package:jumma/src/features/home/domain/usecases/save_pray_time.dart';

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

  sl.registerSingleton<PrayService>(PrayServiceImpl());

  sl.registerSingleton<PrayTimeRepository>(PrayTimeRepositoryImpl());

  sl.registerSingleton<PrayTimeUseCase>(PrayTimeUseCase());

  sl.registerSingleton<SavePrayTimesUseCase>(SavePrayTimesUseCase());

  sl.registerSingleton<LoadPrayTimeUseCase>(LoadPrayTimeUseCase());

  sl.registerSingleton<GetNextPrayerTimeUseCase>(GetNextPrayerTimeUseCase());

  sl.registerSingleton<ClearCacheUseCase>(ClearCacheUseCase());
}
