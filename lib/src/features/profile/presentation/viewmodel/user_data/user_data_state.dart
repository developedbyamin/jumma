part of 'user_data_cubit.dart';

sealed class UserDataState {}

final class UserDataInitial extends UserDataState {}

final class UserDataLoading extends UserDataState {}

final class UserDataSuccess extends UserDataState {
  UserDataSuccess(this.user);
  final UserDataEntity user;
}

final class UserDataFailure extends UserDataState {}
