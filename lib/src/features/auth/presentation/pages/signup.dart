import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jumma/src/core/config/theme/app_colors.dart';
import 'package:jumma/src/features/auth/domain/entities/signup_user.dart';
import 'package:jumma/src/features/auth/presentation/pages/membership.dart';
import 'package:jumma/src/features/auth/presentation/pages/signin.dart';
import 'package:jumma/src/features/auth/presentation/pages/widgets/check_box.dart';
import 'package:jumma/src/features/auth/presentation/pages/widgets/social_icons.dart';
import '../../../../core/assets/assets/app_vectors.dart';
import '../../../../core/common/bottom_navigation_bar/pages/root.dart';
import '../../../../core/common/widgets/elevated_button.dart';
import '../viewmodel/signup_cubit.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _phoneNumber = TextEditingController();
  final TextEditingController _mosque = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool _acceptSubscribe = false;
  bool _acceptMemberShipAgreement = false;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return BlocProvider(
      create: (context) => SignUpCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Jumma',
            style: textTheme.headlineMedium,
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Form(
              key: _formKey,
              child: BlocConsumer<SignUpCubit, SignUpState>(
                listener: (context, state) {
                  if (state is SignUpLoading) {
                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (context) => const Center(
                        child: CircularProgressIndicator(color: AppColors.primary,),
                      ),
                    );
                  } else if (state is SignUpSuccess) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Sign up successful!'),
                      ),
                    );
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const Root(),
                      ),
                    );
                  } else if (state is SignUpFailure) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Sign up failed: ${state.error}'),
                      ),
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
                      _nameTextField(),
                      const SizedBox(
                        height: 8,
                      ),
                      _emailTextField(),
                      const SizedBox(
                        height: 8,
                      ),
                      _phoneTextField(),
                      const SizedBox(
                        height: 8,
                      ),
                      _mosqueTextField(),
                      const SizedBox(
                        height: 8,
                      ),
                      _passwordTextField(),
                      const SizedBox(
                        height: 8,
                      ),
                      _passwordConfirmTextField(),
                      const SizedBox(
                        height: 8,
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              AcceptTermsWidget(
                                value: _acceptSubscribe,
                                onChanged: (bool value) {
                                  setState(() {
                                    _acceptSubscribe = value;
                                  });
                                },
                              ),
                              Text(
                                'I want to subscribe to the page and receive notifications.',
                                style: textTheme.bodySmall,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              AcceptTermsWidget(
                                value: _acceptMemberShipAgreement,
                                onChanged: (bool value) {
                                  setState(
                                    () {
                                      _acceptMemberShipAgreement = value;
                                    },
                                  );
                                },
                              ),
                              RichText(
                                text: TextSpan(
                                  style: textTheme.bodySmall,
                                  children: [
                                    const TextSpan(text: 'I accept the '),
                                    TextSpan(
                                      text: 'membership agreement',
                                      style: textTheme.bodySmall?.copyWith(
                                        color: AppColors
                                            .primary, // Adjust color if needed
                                        decoration: TextDecoration.underline,
                                      ),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                  const Membership(),
                                            ),
                                          );
                                        },
                                    ),
                                    const TextSpan(text: '.'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      JummaElevatedButton(
                        width: double.infinity,
                        onPressed: () {
                          if (_formKey.currentState?.validate() ?? false) {
                            if (!_acceptMemberShipAgreement) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    'You must accept the membership agreement to proceed.',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  backgroundColor: Colors.yellow,
                                ),
                              );
                              return;
                            }

                            final user = SignUpUserEntity(
                              _acceptSubscribe,
                              acceptMemberShipAgreement: _acceptMemberShipAgreement,
                              name: _name.text,
                              email: _email.text,
                              phoneNumber: _phoneNumber.text,
                              mosque: _mosque.text,
                              password: _password.text,
                            );
                            context.read<SignUpCubit>().signUp(user);
                          }
                        },
                        title: 'Sign Up',
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
                            'or sign up with',
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
                        height: 8,
                      ),
                      const SocialIcons(),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Already have an account?',
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
                                      const SignInPage(),
                                ),
                              );
                            },
                            child: const Text(
                              'Log in',
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

  Widget _nameTextField() {
    return TextFormField(
      cursorColor: AppColors.primary,
      controller: _name,
      decoration: const InputDecoration(labelText: 'Name*'),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your name';
        }
        return null;
      },
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

  Widget _phoneTextField() {
    return TextFormField(
      cursorColor: AppColors.primary,
      controller: _phoneNumber,
      decoration: const InputDecoration(labelText: 'Phone Number*'),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your phone number';
        }
        return null;
      },
    );
  }

  Widget _mosqueTextField() {
    return TextFormField(
      cursorColor: AppColors.primary,
      controller: _mosque,
      decoration: const InputDecoration(labelText: 'Mosque*'),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your mosque';
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

  Widget _passwordConfirmTextField() {
    return TextFormField(
      cursorColor: AppColors.primary,
      controller: _confirmPassword,
      decoration: const InputDecoration(labelText: 'Confirm Password*'),
      obscureText: true,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please confirm your password';
        } else if (value != _password.text) {
          return 'Passwords do not match';
        }
        return null;
      },
    );
  }
}
