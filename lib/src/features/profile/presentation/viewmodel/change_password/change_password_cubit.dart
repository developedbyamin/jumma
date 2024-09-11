import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import '../../../data/models/change_password_model.dart';
import '../../../domain/entities/change_password_entity.dart';
import '../../../domain/usecases/change_password_usecase.dart';
import '../../../../../../service_locator.dart';
part 'change_password_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  ChangePasswordCubit() : super(ChangePasswordInitial());

  final passwordController = TextEditingController();
  final newPassController = TextEditingController();
  final repeatPassController = TextEditingController();

  Future<void> changePassword(ChangePasswordEntity changePassword) async {
    try {
      emit(ChangePasswordLoading());
      final updateUserModel = changePassword.toModel();
      await sl<ChangePasswordUsecase>().call(params: updateUserModel);
      emit(ChangePasswordSuccess());
    } catch (e) {
      emit(ChangePasswordFailure('$e'));
    }
  }

  @override
  Future<void> close() {
    passwordController.dispose();
    newPassController.dispose();
    repeatPassController.dispose();
    return super.close();
  }
}
