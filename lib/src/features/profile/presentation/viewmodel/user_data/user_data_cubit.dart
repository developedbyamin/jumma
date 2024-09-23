import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:jumma/service_locator.dart';
import 'package:jumma/src/core/extensions/jwt_extension.dart';
import 'package:rxdart/rxdart.dart';
import '../../../../auth/data/sources/local/token_store.dart';
import '../../../domain/entities/user_data_entity.dart';
import '../../../domain/usecases/user_data_usecase.dart';

part 'user_data_state.dart';

class UserDataCubit extends Cubit<UserDataState> {
  UserDataCubit() : super(UserDataInitial());

  final userData = BehaviorSubject<UserDataEntity?>();

  final nameController = TextEditingController();
  final surnameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();

  Future<void> loadUserProfile() async {
    emailController.text = userData.value!.email;
    nameController.text = userData.value!.firstName;
    surnameController.text = userData.value!.lastName;
    phoneController.text = userData.value!.phoneNumber;
  }

  Future<String> getUId() async {
    final token = await TokenStore.getTokens();
    final accessToken = token!.accessToken;

    return accessToken.getUId();
  }

  Future<UserDataEntity> getUserData() async {
    try {
      final uId = await getUId();
      final user = await sl<UserDataUsecase>().call(params: uId);
      userData.add(user);
    } catch (e) {
      log('$e');
      userData.addError('Error occured');
    }
    throw Exception();
  }
}
