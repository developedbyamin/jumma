part of 'mosque_cubit.dart';

sealed class MosqueState {}

final class MosqueInitial extends MosqueState {}

final class MosqueLoading extends MosqueState {}

final class MosqueSuccess extends MosqueState {
  final List<MosqueEntity> mosques;
  MosqueSuccess({required this.mosques});
}

final class MosqueError extends MosqueState {}
