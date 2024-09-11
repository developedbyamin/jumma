part of 'delete_user_cubit.dart';

sealed class DeleteUserState {}

final class DeleteUserInitial extends DeleteUserState {}

final class DeleteUserLoading extends DeleteUserState {}

final class DeleteUserSuccess extends DeleteUserState {}

final class DeleteUserFailure extends DeleteUserState {
  final String error;

  DeleteUserFailure(this.error);
}
