import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../domain/usecases/select_mosque_usecase.dart';
import '../../../../../../service_locator.dart';
part 'select_mosque_state.dart';

class SelectMosqueCubit extends Cubit<SelectMosqueState> {
  SelectMosqueCubit() : super(SelectMosqueInitial());

  Future<void> selectMosque(int mosqueId) async {
    try {
      emit(SelectMosqueLoading());
      final prefs = await SharedPreferences.getInstance();
      await prefs.setInt('selected_mosque_id', mosqueId);
      await sl<SelectMosqueUsecase>().call(params: mosqueId);
      emit(SelectMosqueSuccess());
    } catch (e) {
      emit(SelectMosqueFailure('$e'));
    }
  }
}
