import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:jumma/service_locator.dart';
import 'package:jumma/src/features/profile/domain/entities/user_data_entity.dart';
import 'package:jumma/src/features/profile/domain/usecases/user_data_usecase.dart';

part 'user_data_state.dart';

class UserDataCubit extends Cubit<UserDataState> {
  UserDataCubit() : super(UserDataInitial());

  Future<UserDataEntity> getUserData(String uId) async {
    try {
      log('message');
      emit(UserDataLoading());
      log('message1');
      final user = await sl<UserDataUsecase>().call(params: uId);
      log('message2');
      emit(UserDataSuccess(user));
    } catch (e) {
      log('$e');
      emit(UserDataFailure());
    }
    throw Exception();
  }
}
