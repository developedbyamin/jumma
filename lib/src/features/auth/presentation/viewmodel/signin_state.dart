part of 'signin_cubit.dart';

@immutable
sealed class SignInState {}

final class SignInInitial extends SignInState {}

class SignInLoading extends SignInState {}

class SignInSuccess extends SignInState {}

class SignInFailure extends SignInState {
  final String error;

  SignInFailure(this.error);
}