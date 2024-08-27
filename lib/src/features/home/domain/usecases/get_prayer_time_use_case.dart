import 'package:dartz/dartz.dart';
import 'package:jumma/src/features/home/domain/repository/prayer_time_repository.dart';
import '../../../../../service_locator.dart';
import '../../../../core/usecase/usecase.dart';

class GetPrayerTimeParams {
  final String city;
  final String month;

  GetPrayerTimeParams({
    required this.city,
    required this.month,

  });
}

class GetPrayerTimeUseCase implements UseCase<Either,GetPrayerTimeParams>{
  @override
  Future<Either> call({GetPrayerTimeParams? params}) async {
    return sl<PrayerTimeRepository>().getPrayTimes(params!.city, params.month);
  }
}