import 'dart:developer';
import 'package:bloc/bloc.dart';
import '../../../domain/usecases/delete_user_usecase.dart';
import '../../../../../../service_locator.dart';
part 'delete_user_state.dart';

class DeleteUserCubit extends Cubit<DeleteUserState> {
  DeleteUserCubit() : super(DeleteUserInitial());

  Future<void> deleteUser(String id) async {
    try {
      emit(DeleteUserLoading());
      await sl<DeleteUserUsecase>().call(params: id);
      emit(DeleteUserSuccess());
    } catch (e) {
      emit(DeleteUserFailure('$e'));
      log('$e');
    }
  }
}
