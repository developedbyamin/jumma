import 'package:dartz/dartz.dart';
import 'package:jumma/src/core/usecase/usecase.dart';
import 'package:jumma/src/features/home/domain/repository/pray_time_repository.dart';
import '../../../../../service_locator.dart';
import '../entities/pray_time.dart';

class PrayTimeUseCase extends UseCase<Either,dynamic>{
  @override
  Future<Either> call({params}) async{
    return await sl<PrayTimeRepository>().getPrayTimes();
  }


  DateTime? getNextPrayerTime(PrayTimeEntity prayTimes) {
    return PrayerTimeCalculator.getNextPrayerTime(DateTime.now(), prayTimes);
  }

}