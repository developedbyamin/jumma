import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jumma/src/core/extensions/jwt_extension.dart';
import '../../../../features/auth/data/sources/local/token_store.dart';
import '../../../../features/imam/presentation/imam_admin_panel.dart';
import '../../../../features/profile/presentation/viewmodel/user_data/user_data_cubit.dart';
import 'root.dart';

class Auth extends StatelessWidget {
  const Auth({super.key});

  Future<String?> _loadUserProfile() async {
    final token = await TokenStore.getTokens();
    final accessToken = token?.accessToken;
    return accessToken?.getUId();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String?>(
      future: _loadUserProfile(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError || !snapshot.hasData || snapshot.data == null) {
          return const Center(child: Text('Failed to load user data'));
        } else {
          final uId = snapshot.data!;
          return Scaffold(
            body: BlocProvider(
              create: (context) => UserDataCubit()..getUserData(uId),
              child: BlocBuilder<UserDataCubit, UserDataState>(
                builder: (context, state) {
                  if (state is UserDataSuccess) {
                    if (state.user.isImam == true) {
                      return const ImamAdminPanel();
                    } else {
                      return const Root();
                    }
                  } else if (state is UserDataFailure) {
                    return const Center(child: Text('Failed to load user data'));
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
          );
        }
      },
    );
  }
}