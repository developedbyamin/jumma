part of 'select_mosque_cubit.dart';

sealed class SelectMosqueState {}

final class SelectMosqueInitial extends SelectMosqueState {}

final class SelectMosqueLoading extends SelectMosqueState {}

final class SelectMosqueSuccess extends SelectMosqueState {}

final class SelectMosqueFailure extends SelectMosqueState {
  SelectMosqueFailure(this.error);
  final String error;
}
