import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../features/imam/presentation/imam_admin_panel.dart';
import '../../../../features/profile/presentation/viewmodel/user_data/user_data_cubit.dart';
import 'root.dart';

class Auth extends StatelessWidget {
  const Auth({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => UserDataCubit()..getUserData(),
        child: StreamBuilder(
          stream: context.read<UserDataCubit>().userData.stream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data!.isImam == true) {
                return const ImamAdminPanel();
              } else {
                return const Root();
              }
            } else if (snapshot.hasError) {
              return const Center(child: Text('Failed to load user data'));
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
