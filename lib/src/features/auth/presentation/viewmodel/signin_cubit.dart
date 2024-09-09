import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jumma/src/features/auth/domain/entities/signin_user.dart';
import '../../../../../service_locator.dart';
import '../../data/models/signin_user.dart';
import '../../domain/usecases/signin_use_case.dart';
part 'signin_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit() : super(SignInInitial());

  Future<void> signIn(SignInUserEntity user) async {
    emit(SignInLoading());
    final signInUserModel = user.toModel();
    var result = await sl<SignInUseCase>().call(params: signInUserModel);
    result.fold(
          (failure) => emit(SignInFailure(failure.toString())),
          (success){
            emit(SignInSuccess());
          },
    );
  }
}
