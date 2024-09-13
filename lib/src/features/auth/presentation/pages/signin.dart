import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jumma/src/core/common/bottom_navigation_bar/pages/auth.dart';
import 'package:jumma/src/core/config/theme/app_colors.dart';
import 'package:jumma/src/features/auth/presentation/pages/widgets/social_icons.dart';
import '../../../../core/assets/assets/app_vectors.dart';
import '../../../../core/common/widgets/elevated_button.dart';
import '../../domain/entities/signin_user.dart';
import '../viewmodel/signin_cubit.dart';
import 'signup.dart';

class SignInPage extends StatelessWidget {
  SignInPage({super.key});

  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return BlocProvider(
      create: (context) => SignInCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Daxil ol',
            style: textTheme.headlineMedium,
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Form(
              key: _formKey,
              child: BlocConsumer<SignInCubit, SignInState>(
                listener: (context, state) {
                  if (state is SignInLoading) {
                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (context) => const Center(
                        child:
                            CircularProgressIndicator(color: AppColors.primary),
                      ),
                    );
                  } else if (state is SignInSuccess) {
                    Navigator.of(context, rootNavigator: true)
                        .pop(); // Dismiss the dialog
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Giriş edildi!',
                          style: TextStyle(color: Colors.white),
                        ),
                        backgroundColor: AppColors.primary,
                        duration: Duration(seconds: 1),
                      ),
                    );
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Auth()
                      ),
                      (Route<dynamic> route) => false,
                    );
                  } else if (state is SignInFailure) {
                    Navigator.of(context, rootNavigator: true)
                        .pop(); // Dismiss the dialog
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Giriş uğursuz! ${state.error}')),
                    );
                  }
                },
                builder: (context, state) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        AppVectors.logo,
                        height: 130.5,
                      ),
                      const SizedBox(height: 16),
                      _emailTextField(),
                      const SizedBox(height: 8),
                      _passwordTextField(),
                      const SizedBox(height: 16),
                      JummaElevatedButton(
                        width: double.infinity,
                        onPressed: () {
                          if (_formKey.currentState?.validate() ?? false) {
                            final user = SignInUserEntity(
                              email: _email.text,
                              password: _password.text,
                            );
                            context.read<SignInCubit>().signIn(user);
                          }
                        },
                        title: 'Daxil ol',
                      ),
                      const SizedBox(height: 32),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Expanded(
                            child: Divider(
                              color: Color(0xFFDFDFDF),
                              endIndent: 10,
                            ),
                          ),
                          Text(
                            'və ya ilə daxil olun',
                            style: textTheme.bodySmall,
                          ),
                          const Expanded(
                            child: Divider(
                              color: Color(0xFFDFDFDF),
                              indent: 10,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      const SocialIcons(),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Hesabınız yoxdur?",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      const SignUpPage(),
                                ),
                              );
                            },
                            child: const Text(
                              'Qeydiyyatdan keç',
                              style: TextStyle(color: AppColors.primary),
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _emailTextField() {
    return TextFormField(
      cursorColor: AppColors.primary,
      controller: _email,
      decoration: const InputDecoration(labelText: 'Elektron poçt*'),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your email';
        } else if (!value.contains('@')) {
          return 'Please enter a valid email';
        }
        return null;
      },
    );
  }

  Widget _passwordTextField() {
    return TextFormField(
      cursorColor: AppColors.primary,
      controller: _password,
      decoration: const InputDecoration(labelText: 'Parol*'),
      obscureText: true,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your password';
        } else if (value.length < 6) {
          return 'Password must be at least 6 characters long';
        }
        return null;
      },
    );
  }
}
