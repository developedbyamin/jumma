import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/profile/presentation/viewmodel/change_password/change_password_cubit.dart';
import '../../features/profile/presentation/pages/change_password.dart';
import '../../features/profile/presentation/pages/edit_profile.dart';
import '../../features/profile/presentation/viewmodel/update_profile/update_profile_cubit.dart';

class Pager {
  Pager._();

  static Widget get editProfile => BlocProvider(
        create: (context) => UpdateProfileCubit(),
        child: const EditProfile(),
      );

  static Widget get changePassword => BlocProvider(
        create: (context) => ChangePasswordCubit(),
        child: const ChangePassword(),
      );    
}
