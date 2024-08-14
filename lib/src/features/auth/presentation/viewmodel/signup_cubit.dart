import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jumma/src/features/auth/domain/entities/signup_user.dart';
import '../../../../../service_locator.dart';
import '../../data/models/signup_user.dart';
import '../../domain/usecases/signup_use_case.dart';

part 'signup_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());

  Future<void> signUp(SignUpUserEntity user) async {
    emit(SignUpLoading());
    final signUpUserModel = user.toModel();
    var result = await sl<SignUpUseCase>().call(params: signUpUserModel);

    result.fold(
          (failure) => emit(SignUpFailure(failure.toString())),
          (user) => emit(SignUpSuccess()),
    );
  }

}
