import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:jumma/src/core/extensions/jwt_extension.dart';
import '../../../../auth/data/sources/local/token_store.dart';
import '../../../domain/usecases/delete_user_usecase.dart';
import '../../../../../../service_locator.dart';
part 'delete_user_state.dart';

class DeleteUserCubit extends Cubit<DeleteUserState> {
  DeleteUserCubit() : super(DeleteUserInitial());

  Future<String> getUId() async {
    final token = await TokenStore.getTokens();
    final accessToken = token!.accessToken;

    return accessToken.getUId();
  }

  Future<void> deleteUser() async {
    try {
      final uId = await getUId();
      emit(DeleteUserLoading());
      await sl<DeleteUserUsecase>().call(params: uId);
      emit(DeleteUserSuccess());
    } catch (e) {
      emit(DeleteUserFailure('$e'));
      log('$e');
    }
  }
}
