import 'package:jumma/src/features/home/domain/entities/pray_time.dart';

class PrayTimeModel {
  final String fajr;
  final String dhuhr;
  final String asr;
  final String maghrib;
  final String isha;

  PrayTimeModel({
    required this.fajr,
    required this.dhuhr,
    required this.asr,
    required this.maghrib,
    required this.isha,
  });

  Map<String, dynamic> toJson() {
    return {
      'Fajr': fajr,
      'Dhuhr': dhuhr,
      'Asr': asr,
      'Maghrib': maghrib,
      'Isha': isha,
    };
  }

  factory PrayTimeModel.fromJson(Map<String, dynamic> json) {
    final prayers = json['prayers'] as List<dynamic>;
    return PrayTimeModel(
      fajr: prayers[0] ?? '',
      dhuhr: prayers[2] ?? '',
      asr: prayers[3] ?? '',
      maghrib: prayers[4] ?? '',
      isha: prayers[5] ?? '',
    );
  }
}

extension PrayTimeModelX on PrayTimeModel {
  PrayTimeEntity toEntity() {
    return PrayTimeEntity(
      fajr: fajr,
      dhuhr: dhuhr,
      asr: asr,
      maghrib: maghrib,
      isha: isha,
    );
  }
}
