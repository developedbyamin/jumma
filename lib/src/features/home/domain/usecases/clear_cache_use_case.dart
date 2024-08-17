import 'package:jumma/src/core/usecase/usecase.dart';
import 'package:jumma/src/features/home/domain/repository/pray_time_repository.dart';
import '../../../../../service_locator.dart';

class ClearCacheUseCase extends UseCase<void,void>{
  @override
  Future<void> call({params}) async{
    return await sl<PrayTimeRepository>().clearCache();
  }
}