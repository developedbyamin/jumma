part of 'update_profile_cubit.dart';

sealed class UpdateProfileState {}

final class UpdateProfileInitial extends UpdateProfileState {}

final class UpdateProfileLoading extends UpdateProfileState {}

final class UpdateProfileSuccess extends UpdateProfileState {}

class UpdateProfileFailure extends UpdateProfileState {
  final String message;

  UpdateProfileFailure(this.message);
}
