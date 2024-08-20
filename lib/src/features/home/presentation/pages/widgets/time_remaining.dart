import 'dart:async';
import 'package:flutter/material.dart';
import '../../../domain/entities/pray_time.dart';

class TimeRemainingWidget extends StatefulWidget {
  final DateTime nextPrayerTime;
  final String nextPrayerName;

  const TimeRemainingWidget({
    super.key,
    required this.nextPrayerTime,
    required this.nextPrayerName,
  });

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
    final Duration timeRemaining = widget.nextPrayerTime.difference(_now);
    if (timeRemaining.isNegative || timeRemaining.inSeconds == 0) {
      return const Text(
        'Namaz vaxtıdır',
        style: TextStyle(
            fontSize: 12, color: Color(0xFFA9A9A9), fontWeight: FontWeight.w400),
      );
    }
    final String remainingTimeText = PrayerTimeCalculator.calculateTimeRemaining(
        widget.nextPrayerTime, _now);
    return Text(
      '${widget.nextPrayerName} namazına $remainingTimeText qaldı',
      style: const TextStyle(
          fontSize: 12, color: Color(0xFFA9A9A9), fontWeight: FontWeight.w400),
    );
  }
}
