import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jumma/src/features/mosque/domain/entities/mosque_entity.dart';
import 'package:jumma/src/features/mosque/domain/usecases/mosque_usecase.dart';

import '../../../../../../service_locator.dart';

part 'mosque_state.dart';

class MosqueCubit extends Cubit<MosqueState> {
  MosqueCubit() : super(MosqueInitial());

  void getMosques() async {
    try {
      emit(MosqueLoading());
      final result = await sl<MosqueUsecase>().call();
      result.fold(
              (failure) {
            print("Error occurred: $failure");
            emit(MosqueError());
          },
              (data) {
            print("Fetched mosques: $data");
            emit(MosqueSuccess(mosques: data));
          }
      );
    } catch (e) {
      print("Exception occurred: $e");
      emit(MosqueError());
    }
  }
}
