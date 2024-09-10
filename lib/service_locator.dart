import 'package:get_it/get_it.dart';
import 'package:jumma/src/features/auth/data/repository/auth_impl.dart';
import 'package:jumma/src/features/auth/data/sources/remote/auth_service.dart';
import 'package:jumma/src/features/auth/domain/repository/auth.dart';
import 'package:jumma/src/features/auth/domain/usecases/signin_use_case.dart';
import 'package:jumma/src/features/auth/domain/usecases/signup_use_case.dart';
import 'package:jumma/src/features/home/data/repository/prayer_time_repository_impl.dart';
import 'package:jumma/src/features/home/data/sources/local/pray_service.dart';
import 'package:jumma/src/features/home/domain/repository/prayer_time_repository.dart';
import 'package:jumma/src/features/home/domain/usecases/get_prayer_time_use_case.dart';
import 'package:jumma/src/features/home/presentation/viewmodel/fetch_prayer_times_bloc.dart';
import 'package:jumma/src/features/mosque/data/repository/mosque_repository_impl.dart';
import 'package:jumma/src/features/mosque/data/sources/mosque_service.dart';
import 'package:jumma/src/features/mosque/domain/repository/mosque_repository.dart';
import 'package:jumma/src/features/mosque/domain/usecases/mosque_usecase.dart';
import 'package:jumma/src/features/profile/data/repository/user_profile_repository_impl.dart';
import 'package:jumma/src/features/profile/data/sources/user_profile_service.dart';
import 'package:jumma/src/features/profile/domain/repository/user_profile_repository.dart';
import 'package:jumma/src/features/profile/domain/usecases/update_user_profile_usecase.dart';
import 'src/features/profile/domain/usecases/change_password_usecase.dart';


final GetIt sl = GetIt.instance;

Future<void> initializeDependencies() async {
  // AUTH SERVICE
  sl.registerSingleton<AuthService>(AuthServiceImpl());

  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());

  sl.registerSingleton<SignUpUseCase>(SignUpUseCase());

  sl.registerSingleton<SignInUseCase>(
    SignInUseCase(),
  );

  // User Profile
  sl.registerSingleton<UserProfileService>(UserProfileServiceImpl());
  sl.registerSingleton<UserProfileRepository>(UserProfileRepositoryImpl());
  sl.registerSingleton<UpdateUserProfileUsecase>(UpdateUserProfileUsecase());
  sl.registerSingleton<ChangePasswordUsecase>(ChangePasswordUsecase());

  // Home
  sl.registerSingleton<PrayerTimeService>(PrayerTimeServiceImpl());

  sl.registerSingleton<PrayerTimeRepository>(PrayerTimeRepositoryImpl());

  sl.registerSingleton<GetPrayerTimeUseCase>(GetPrayerTimeUseCase());

  sl.registerSingleton<FetchPrayerTimesBloc>(FetchPrayerTimesBloc());

  // Mosque

  sl.registerSingleton<MosqueRepository>(MosqueRepositoryImpl());
  sl.registerSingleton<MosqueService>(MosqueServiceImpl());
  sl.registerSingleton<MosqueUsecase>(MosqueUsecase());

}
