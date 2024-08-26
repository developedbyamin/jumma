import 'package:jumma/src/core/usecase/usecase.dart';
import 'package:jumma/src/features/home/domain/repository/pray_time_repository.dart';
import '../../../../../service_locator.dart';

class GetNextPrayerTimeUseCase extends UseCase<DateTime?,dynamic>{
  @override
  Future<DateTime?> call({params}) async{
    return await sl<PrayTimeRepository>().getNextPrayerTime(params);
  }
}