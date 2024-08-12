import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../service_locator.dart';
import '../../data/models/signin_user.dart';
import '../../data/models/signup_user.dart';
import '../../domain/usecases/signin_use_case.dart';
import '../../domain/usecases/signup_use_case.dart';

part 'signup_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());

  Future<void> signUp(SignUpUserModel user) async {
    emit(SignUpLoading());

    var result = await sl<SignUpUseCase>().call(params: user);

    result.fold(
          (failure) => emit(SignUpFailure(failure.toString())),
          (user) => emit(SignUpSuccess()),
    );
  }

}
