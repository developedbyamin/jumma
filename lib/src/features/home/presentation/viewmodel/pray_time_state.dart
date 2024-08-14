part of 'pray_time_cubit.dart';

@immutable
sealed class PrayTimeState {}

class PrayTimeLoading extends PrayTimeState{}

class PrayTimeSuccess extends PrayTimeState{
  final PrayTimeEntity prayTimes;

  PrayTimeSuccess({required this.prayTimes});

}

class PrayTimeFailure extends PrayTimeState{}