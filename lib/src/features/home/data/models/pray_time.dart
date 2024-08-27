import '../../domain/entities/pray_time.dart';

class PrayerTimeModel {
  final String tarix;
  final String subh;
  final String gunes;
  final String gunorta;
  final String ikindi;
  final String axsam;
  final String yatsi;

  PrayerTimeModel({
    required this.tarix,
    required this.subh,
    required this.gunes,
    required this.gunorta,
    required this.ikindi,
    required this.axsam,
    required this.yatsi,
  });

  // Create a factory method to create a PrayerTime instance from JSON
  factory PrayerTimeModel.fromJson(Map<String, dynamic> json) {
    return PrayerTimeModel(
      tarix: json['tarix'],
      subh: json['subh'],
      gunes: json['gunes'],
      gunorta: json['gunorta'],
      ikindi: json['ikindi'],
      axsam: json['axsam'],
      yatsi: json['yatsi'],
    );
  }

  // Convert a PrayerTime instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'tarix': tarix,
      'subh': subh,
      'gunes': gunes,
      'gunorta': gunorta,
      'ikindi': ikindi,
      'axsam': axsam,
      'yatsi': yatsi,
    };
  }
}

extension PrayerTimeToEntity on PrayerTimeModel {
  PrayerTimeEntity toEntity() {
    return PrayerTimeEntity(
      tarix: tarix,
      subh: subh,
      gunes: gunes,
      gunorta: gunorta,
      ikindi: ikindi,
      axsam: axsam,
      yatsi: yatsi,
    );
  }
}


