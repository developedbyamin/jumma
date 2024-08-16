import 'package:flutter/material.dart';

class PrayTimeEntity {
  final String fajr;
  final String dhuhr;
  final String asr;
  final String maghrib;
  final String isha;

  PrayTimeEntity({
    required this.fajr,
    required this.dhuhr,
    required this.asr,
    required this.maghrib,
    required this.isha,
  });
}

class PrayerTimeCalculator {

  static DateTime parsePrayerTime(String time) {
    final now = DateTime.now();
    return DateTime(now.year, now.month, now.day,
        int.parse(time.split(':')[0]),
        int.parse(time.split(':')[1]));
  }

  static DateTime? getNextPrayerTime(DateTime currentTime, PrayTimeEntity prayTimes) {
    List<DateTime> prayerTimes = [
      parsePrayerTime(prayTimes.fajr),
      parsePrayerTime(prayTimes.dhuhr),
      parsePrayerTime(prayTimes.asr),
      parsePrayerTime(prayTimes.maghrib),
      parsePrayerTime(prayTimes.isha),
    ];

    return prayerTimes
        .where((time) => time.isAfter(currentTime))
        .reduce((a, b) => a.isBefore(b) ? a : b);
  }

  static bool isNextPrayerTime(String prayerTime, DateTime? nextPrayerTime) {
    final prayerDateTime = PrayerTimeCalculator.parsePrayerTime(prayerTime);
    return nextPrayerTime != null && prayerDateTime == nextPrayerTime;
  }

  static Widget buildPrayTimeRow(String title, String time, bool isNext) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(color: isNext ? Colors.green : Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
              time,
              style: TextStyle(color: isNext ? Colors.green : Colors.black, fontWeight: FontWeight.w400, fontSize: 16),
            ),
          ],
        ),
        const Divider(),
      ],
    );
  }

  static String calculateTimeRemaining(DateTime nextPrayerTime, DateTime now) {
    final difference = nextPrayerTime.difference(now);

    final hours = difference.inHours;
    final minutes = difference.inMinutes.remainder(60);
    final seconds = difference.inSeconds.remainder(60);

    final formattedHours = hours.toString().padLeft(2, '0');
    final formattedMinutes = minutes.toString().padLeft(2, '0');
    final formattedSeconds = seconds.toString().padLeft(2, '0');

    return '$formattedHours:$formattedMinutes:$formattedSeconds';
  }

  static String dataTimeToString(DateTime dateTime) {
    final hours = dateTime.hour.toString().padLeft(2, '0');
    final minutes = dateTime.minute.toString().padLeft(2, '0');
    return '$hours:$minutes';
  }

}
