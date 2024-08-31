import 'package:flutter/material.dart';

import '../../../../domain/entities/pray_time.dart';

class PrayerTimesWidget extends StatelessWidget {
  final List<PrayerTimeEntity> prayerTimes;
  const PrayerTimesWidget({super.key, required this.prayerTimes});

  @override
  Widget build(BuildContext context) {
    var today = DateTime.now().day - 1;
    final Map<String,String> prayer = {
      "Tarix": prayerTimes[today].tarix,
      "Sübh": prayerTimes[today].subh,
      "Gün çıxma": prayerTimes[today].gunes,
      "Günorta (Zöhr)": prayerTimes[today].gunorta,
      "İkindi (Əsr)": prayerTimes[today].ikindi,
      "Axşam (Məğrib)": prayerTimes[today].axsam,
      "Yatsı (İşa)": prayerTimes[today].yatsi,
    };
    return SizedBox(
      height: 270,
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
              children: prayer.entries.map((entry) {
            return _buildTimeRow(entry.key, entry.value);
          }).toList()
      ),
    );
  }

  Widget _buildTimeRow(String label, String time) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            Text(time, style: const TextStyle(fontSize: 16)),
          ],
        ),
        const Divider(),
      ],
    );
  }
}
