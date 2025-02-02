import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../data/models/requests/register_request_body.dart';
import '../../../../data/repositary/auth_repo.dart';

part 'register_state.dart';

@injectable
class RegisterCubit extends Cubit<RegisterState> {
  final AuthRepo _authRepo;
  RegisterCubit(this._authRepo) : super(RegisterInitial());
  Future<void> register(final RegisterRequestBody registerRequestBody) async {
    emit(RegisterLoading());
    final response = await _authRepo.register(registerRequestBody);
    response.fold(
      (error) {
        emit(RegisterFailure(error));
      },
      (result) => emit(RegisterSuccess()),
    );
  }
}
