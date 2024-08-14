import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jumma/src/core/assets/assets/app_vectors.dart';
import '../../../domain/entities/pray_time.dart';
import '../../viewmodel/pray_time_cubit.dart';

class TimeRemainingWidget extends StatefulWidget {
    final DateTime nextPrayerTime;

  const TimeRemainingWidget({super.key, required this.nextPrayerTime});

  @override
  State<TimeRemainingWidget> createState() => _TimeRemainingWidgetState();
}

class _TimeRemainingWidgetState extends State<TimeRemainingWidget> {
  late Timer _timer;
  late DateTime _now;

  @override
  void initState() {
    super.initState();
    _now = DateTime.now();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _now = DateTime.now();
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      '${PrayerTimeCalculator.calculateTimeRemaining(widget.nextPrayerTime, _now)} left',
      style: const TextStyle(fontSize: 12, color: Color(0xFFA9A9A9), fontWeight: FontWeight.w400),
    );
  }
}

class PrayTimeView extends StatelessWidget {
  const PrayTimeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PrayTimeCubit, PrayTimeState>(
      builder: (context, state) {
        if (state is PrayTimeLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is PrayTimeSuccess) {
          final prayTimes = state.prayTimes;
          final nextPrayerTime = state.nextPrayerTime;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Next prayer',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400,color: Colors.black),
                      ),
                      Text(PrayerTimeCalculator.dataTimeToString(nextPrayerTime),style: const TextStyle(color: Colors.black, fontSize: 36, fontWeight: FontWeight.w700),),
                      TimeRemainingWidget(nextPrayerTime: nextPrayerTime),
                    ],
                  ),
                  SvgPicture.asset(AppVectors.logo, height: MediaQuery.of(context).size.height * 0.12,),
                ],
              ),
              const SizedBox(height: 16),
              PrayerTimeCalculator.buildPrayTimeRow('Fajr', prayTimes.fajr, PrayerTimeCalculator.isNextPrayerTime(prayTimes.fajr, nextPrayerTime)),
              PrayerTimeCalculator.buildPrayTimeRow('Dhuhr', prayTimes.dhuhr, PrayerTimeCalculator.isNextPrayerTime(prayTimes.dhuhr, nextPrayerTime)),
              PrayerTimeCalculator.buildPrayTimeRow('Asr', prayTimes.asr, PrayerTimeCalculator.isNextPrayerTime(prayTimes.asr, nextPrayerTime)),
              PrayerTimeCalculator.buildPrayTimeRow('Maghrib', prayTimes.maghrib, PrayerTimeCalculator.isNextPrayerTime(prayTimes.maghrib, nextPrayerTime)),
              PrayerTimeCalculator.buildPrayTimeRow('Isha', prayTimes.isha, PrayerTimeCalculator.isNextPrayerTime(prayTimes.isha, nextPrayerTime)),
            ],
          );
        } else if (state is PrayTimeFailure) {
          return const Center(child: Text('Failed to load prayer times'));
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }



}

