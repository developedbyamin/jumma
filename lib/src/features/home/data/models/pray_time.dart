import 'package:jumma/src/features/home/domain/entities/pray_time.dart';

class PrayTimeModel extends PrayTimeEntity {
  PrayTimeModel({
    required super.fajr,
    required super.dhuhr,
    required super.asr,
    required super.maghrib,
    required super.isha,
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
    return PrayTimeModel(
      fajr: json['Fajr'],
      dhuhr: json['Dhuhr'],
      asr: json['Asr'],
      maghrib: json['Maghrib'],
      isha: json['Isha'],
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