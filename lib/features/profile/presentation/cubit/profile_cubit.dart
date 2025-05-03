import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/core/networking/api_result.dart';
import 'package:e_commerce_app/features/profile/domain/entity/profile_user_entity.dart';
import 'package:e_commerce_app/features/profile/domain/use_cases/get_logged_user_data_use_case.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'profile_state.dart';

@injectable
class ProfileCubit extends Cubit<ProfileState> {
  final GetLoggedUserDataUseCase _getLoggedUserDataUseCase;
  ProfileCubit(this._getLoggedUserDataUseCase) : super(ProfileInitial());

  Future<void> GetLoggedUserData() async {
    emit(ProfileLoading());
    final response = await _getLoggedUserDataUseCase.getLoggedUserData();
    switch (response) {
      case Success():
        emit(ProfileSuccess(response.data));

      case Error():
        emit(ProfileFailure(response.exception.toString()));
    }
  }
}
