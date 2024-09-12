import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:jumma/src/core/extensions/jwt_extension.dart';
import '../../../../auth/data/sources/local/token_store.dart';
import '../../../data/models/user_profile_model.dart';
import '../../../domain/entities/user_profile_entity.dart';
import '../../../domain/usecases/update_user_profile_usecase.dart';
import '../../../../../../service_locator.dart';
part 'update_profile_state.dart';

class UpdateProfileCubit extends Cubit<UpdateProfileState> {
  UpdateProfileCubit() : super(UpdateProfileInitial());

  final nameController = TextEditingController();
  final surnameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();

  String uId = '';
  String email = '';
  String name = '';
  String surname = '';
  String phone = '';

  Future<void> loadUserProfile() async {
    final token = await TokenStore.getTokens();
    final accessToken = token!.accessToken;

    uId = accessToken.getUId();
    email = accessToken.getUserEmail();
    name = accessToken.getName();
    surname = accessToken.getSurname();
    phone = accessToken.getPhone();

    emailController.text = email;
    nameController.text = name;
    surnameController.text = surname;
    phoneController.text = phone;
  } 

  Future<void> updateProfile(UserProfileEntity userProfile) async {
    try {
      emit(UpdateProfileLoading());
      final updateUserModel = userProfile.toModel();
      await sl<UpdateUserProfileUsecase>().call(params: updateUserModel);
      emit(UpdateProfileSuccess());
    } catch (e) {
      emit(UpdateProfileFailure('$e'));
      log('$e');
    }
  }

  @override
  Future<void> close() {
    nameController.dispose();
    surnameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    return super.close();
  }
}
