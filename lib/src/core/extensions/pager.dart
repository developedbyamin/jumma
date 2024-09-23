import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jumma/src/features/mosque/presentation/viewmodel/cubit/mosque_cubit.dart';
import 'package:jumma/src/features/profile/presentation/pages/select_mosque.dart';
import 'package:jumma/src/features/profile/presentation/viewmodel/select_mosque/select_mosque_cubit.dart';
import 'package:jumma/src/features/profile/presentation/viewmodel/user_data/user_data_cubit.dart';
import '../../features/profile/presentation/viewmodel/change_password/change_password_cubit.dart';
import '../../features/profile/presentation/pages/change_password.dart';
import '../../features/profile/presentation/pages/edit_profile.dart';
import '../../features/profile/presentation/viewmodel/update_profile/update_profile_cubit.dart';

class Pager {
  Pager._();

  static Widget get editProfile => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => UpdateProfileCubit(),
          ),
          BlocProvider(
            create: (context) => UserDataCubit()..loadUserProfile(),
          ),
        ],
        child: const EditProfile(),
      );

  static Widget get changePassword => BlocProvider(
        create: (context) => ChangePasswordCubit(),
        child: const ChangePassword(),
      );

  static Widget get selectMosque => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => SelectMosqueCubit(),
          ),
          BlocProvider(
            create: (context) => MosqueCubit()..getMosques(),
          ),
        ],
        child: const SelectMosque(),
      );
}
