import 'dart:async';
import 'package:flutter/material.dart';

class NextPrayerTimeWidget extends StatefulWidget {
  final DateTime nextPrayerTime;

  const NextPrayerTimeWidget({super.key, required this.nextPrayerTime});

  @override
  State<NextPrayerTimeWidget> createState() => _NextPrayerTimeWidgetState();
}

class _NextPrayerTimeWidgetState extends State<NextPrayerTimeWidget> {
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

    // Check if the remaining time is zero or less
    if (timeRemaining.isNegative || timeRemaining.inSeconds == 0) {
      return const Text(
        'Bu gün üçün namaz bitmişdir ',
        style: TextStyle(
            fontSize: 12, color: Color(0xFFA9A9A9), fontWeight: FontWeight.w400),
      );
    }

    // Show the remaining time
    final String remainingTimeText = calculateTimeRemaining(
        widget.nextPrayerTime, _now);

    return Text(
      '$remainingTimeText left',
      style: const TextStyle(
          fontSize: 12, color: Color(0xFFA9A9A9), fontWeight: FontWeight.w400),
    );
  }
}

String calculateTimeRemaining(DateTime nextPrayerTime, DateTime now) {
  Duration difference = nextPrayerTime.difference(now);

  int days = difference.inDays;
  int hours = difference.inHours.remainder(24);
  int minutes = difference.inMinutes.remainder(60);
  int seconds = difference.inSeconds.remainder(60);

  List<String> parts = [];

  if (days > 0) {
    parts.add("$days day${days > 1 ? 's' : ''}");
  }

  if (hours > 0) {
    parts.add("$hours hour${hours > 1 ? 's' : ''}");
  }

  if (minutes > 0) {
    parts.add("$minutes minute${minutes > 1 ? 's' : ''}");
  }

  if (seconds > 0 || parts.isEmpty) {
    parts.add("$seconds second${seconds > 1 ? 's' : ''}");
  }

  return parts.join(', ');
}
