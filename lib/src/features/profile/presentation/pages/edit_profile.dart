import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../domain/entities/user_profile_entity.dart';
import 'widgets/alert_button.dart';
import '../viewmodel/update_profile/update_profile_cubit.dart';
import 'widgets/delete_button.dart';
import '../../../../core/extensions/sizedbox_extension.dart';
import 'widgets/custom_text_input.dart';
import '../../../../core/config/theme/app_colors.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final cubit = context.read<UpdateProfileCubit>();
    final formKey = GlobalKey<FormState>();
    cubit.emailController.text = 'eseyfullayev51@gmail.com';
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit Profile',
          style: textTheme.headlineMedium,
        ),
        centerTitle: true,
        actions: [
          BlocListener<UpdateProfileCubit, UpdateProfileState>(
            listener: (context, state) {
              if (state is UpdateProfileSuccess) {
                Navigator.of(context).pop();
              } else if (state is UpdateProfileFailure) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                      content:
                          Text('Failed to update profile: ${state.message}')),
                );
              }
            },
            child: TextButton(
                onPressed: () {
                  if (formKey.currentState?.validate() ?? false) {
                    final name = cubit.nameController.text.trim();
                    final surname = cubit.surnameController.text.trim();
                    final email = cubit.emailController.text.trim();
                    final phone = cubit.phoneController.text.trim();
                    cubit.updateProfile(UserProfileEntity(
                        firstName: name,
                        lastName: surname,
                        phoneNumber: phone,
                        email: email));
                  }
                },
                child: Text(
                  'Save',
                  style: GoogleFonts.dmSans(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: AppColors.primary),
                )),
          )
        ],
      ),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                CustomTextInput(
                  hintText: 'Name',
                  controller: cubit.nameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Name cannot be empty';
                    }
                    return null;
                  },
                ),
                12.h,
                CustomTextInput(
                  hintText: 'Surname',
                  controller: cubit.surnameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Surname cannot be empty';
                    }
                    return null;
                  },
                ),
                12.h,
                CustomTextInput(
                  hintText: 'Email',
                  readOnly: true,
                  controller: cubit.emailController,
                ),
                12.h,
                CustomTextInput(
                  hintText: '0555555555',
                  keyboardType: TextInputType.number,
                  controller: cubit.phoneController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Number cannot be empty';
                    }
                    return null;
                  },
                ),
                36.h,
                DeleteButton(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          title: Text(
                            'Are you sure to delete the page?',
                            style: GoogleFonts.dmSans(fontSize: 18),
                            textAlign: TextAlign.center,
                          ),
                          actionsAlignment: MainAxisAlignment.center,
                          actions: [
                            Column(
                              children: [
                                AlertButton(
                                    text: 'Delete',
                                    color: AppColors.red,
                                    textColor: AppColors.white,
                                    onTap: () {
                                      Navigator.of(context).pop();
                                    }),
                                8.h,
                                AlertButton(
                                    text: 'Go back',
                                    color: AppColors.white,
                                    borderColor: AppColors.primary,
                                    textColor: AppColors.primary,
                                    onTap: () {
                                      Navigator.of(context).pop();
                                    }),
                              ],
                            ),
                          ],
                        );
                      },
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
