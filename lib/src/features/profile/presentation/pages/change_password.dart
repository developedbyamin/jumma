import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/assets/assets/app_vectors.dart';
import '../../../../core/config/theme/app_colors.dart';
import '../../domain/entities/change_password_entity.dart';
import 'widgets/alert_button.dart';
import '../../../../core/common/widgets/elevated_button.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../../core/extensions/sizedbox_extension.dart';
import '../viewmodel/change_password/change_password_cubit.dart';
import 'widgets/custom_text_input.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final cubit = context.read<ChangePasswordCubit>();
    //final formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Change Password',
          style: textTheme.headlineMedium,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              CustomTextInput(
                hintText: 'Current password',
                controller: cubit.passwordController,
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your current password';
                  }
                  return null;
                },
              ),
              12.h,
              CustomTextInput(
                hintText: 'New password',
                controller: cubit.newPassController,
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your new password';
                  }
                  return null;
                },
              ),
              12.h,
              CustomTextInput(
                hintText: 'Repeat new password',
                controller: cubit.repeatPassController,
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please re-enter your new password';
                  }
                  return null;
                },
              ),
              14.h,
              TextButton(
                  onPressed: () {},
                  child: Text(
                    'Don’t know current password?',
                    style: GoogleFonts.dmSans(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: Colors.blue),
                  )),
              27.h,
              BlocListener<ChangePasswordCubit, ChangePasswordState>(
                listener: (context, state) {
                  if (state is ChangePasswordFailure) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content:
                              Text('Failed to update profile: ${state.error}')),
                    );
                  } else if (state is ChangePasswordSuccess) {
                    _showSuccessDialog(context);
                  }
                },
                child: JummaElevatedButton(
                  onPressed: () {
                    
                      final entity = ChangePasswordEntity(
                          currentPassword: cubit.passwordController.text,
                          newPassword: cubit.newPassController.text,
                          reNewPassword: cubit.repeatPassController.text);
                      cubit.changePassword(entity);
                    
                  },
                  width: context.fullWidth,
                  title: 'Save',
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 30, horizontal: 15),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(AppVectors.success),
              34.h,
              Text(
                'You have successfully changed password!',
                textAlign: TextAlign.center,
                style: GoogleFonts.dmSans(fontSize: 18),
              ),
              34.h,
              AlertButton(
                  text: 'Close',
                  color: AppColors.white,
                  borderColor: AppColors.primary,
                  textColor: AppColors.primary,
                  onTap: () {
                    Navigator.of(context).pop();
                  }),
            ],
          ),
        );
      },
    );
  }
}
