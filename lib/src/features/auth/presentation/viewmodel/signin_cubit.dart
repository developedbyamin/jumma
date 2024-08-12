import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../service_locator.dart';
import '../../data/models/signin_user.dart';
import '../../domain/usecases/signin_use_case.dart';

part 'signin_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit() : super(SignInInitial());

  Future<void> signUp(SignInUserModel user) async {
    emit(SignInLoading());

    var result = await sl<SignInUseCase>().call(params: user);

    result.fold(
          (failure) => emit(SignInFailure(failure.toString())),
          (user) => emit(SignInSuccess()),
    );
  }
}
