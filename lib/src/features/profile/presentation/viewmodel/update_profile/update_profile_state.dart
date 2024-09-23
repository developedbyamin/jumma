part of 'update_profile_cubit.dart';

sealed class UpdateProfileState {}

class UpdateProfileInitial extends UpdateProfileState {}

class UpdateProfileLoading extends UpdateProfileState {}

class UpdateProfileSuccess extends UpdateProfileState {} 

class UpdateProfileNavigateBack extends UpdateProfileState {}

class UpdateProfileFailure extends UpdateProfileState {
  final String message;

  UpdateProfileFailure(this.message);
}
