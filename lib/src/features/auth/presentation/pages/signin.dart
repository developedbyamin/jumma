import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jumma/src/common/widgets/elevated_button.dart';
import 'package:jumma/src/core/config/theme/app_colors.dart';
import 'package:jumma/src/features/auth/presentation/pages/widgets/social_icons.dart';
import '../../../../core/assets/assets/app_vectors.dart';
import '../../data/models/signin_user.dart';
import '../viewmodel/signin_cubit.dart';
import 'package:jumma/src/features/home/presentation/pages/home.dart';

import 'signup.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
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
            'Sign In',
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
                    // Handle loading state if needed
                  } else if (state is SignInSuccess) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Sign in successful!')),
                    );
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (_) => const HomePage()),
                    );
                  } else if (state is SignInFailure) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Sign in failed: ${state.error}')),
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
                            final user = SignInUserModel(
                              email: _email.text,
                              password: _password.text,
                            );
                            context.read<SignInCubit>().signUp(user);
                          }
                        },
                        title: 'Sign In',
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
                            'or sign in with',
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
                      const SizedBox(
                        height: 16,
                      ),
                      const SocialIcons(),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Don't have a account?",
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
                              'Sign up',
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
      decoration: const InputDecoration(labelText: 'Email*'),
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
      decoration: const InputDecoration(labelText: 'Password*'),
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
