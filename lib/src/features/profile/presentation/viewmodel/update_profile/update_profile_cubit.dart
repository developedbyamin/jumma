import 'dart:developer';
import 'package:bloc/bloc.dart';
import '../../../data/models/user_profile_model.dart';
import '../../../domain/entities/user_profile_entity.dart';
import '../../../domain/usecases/update_user_profile_usecase.dart';
import '../../../../../../service_locator.dart';
part 'update_profile_state.dart';

class UpdateProfileCubit extends Cubit<UpdateProfileState> {
  UpdateProfileCubit() : super(UpdateProfileInitial());

  Future<void> updateProfile(UserProfileEntity userProfile) async {
    try {
      emit(UpdateProfileLoading());
      final updateUserModel = userProfile.toModel();
      await sl<UpdateUserProfileUsecase>().call(params: updateUserModel);
      emit(UpdateProfileSuccess());
    } catch (e) {
      emit(UpdateProfileFailure('$e'));
      log('$e');
    }
  }
}
