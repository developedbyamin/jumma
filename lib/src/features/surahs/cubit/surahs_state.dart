part of 'surahs_cubit.dart';

sealed class SurahsState {}

final class SurahsInitial extends SurahsState {}

final class SurahsLoading extends SurahsState {}

final class SurahsSuccess extends SurahsState {
  final List surahsData;
  SurahsSuccess(this.surahsData);
}

final class SurahsError extends SurahsState {
  final String message;

  SurahsError(this.message);
}
