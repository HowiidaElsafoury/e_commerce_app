import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/features/home/domain/entities/home_data_entity.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../domain/use_cases/get_home_data_use_case.dart';

part 'home_state.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  final GetHomeDataUseCase _getHomeDataUseCase;
  HomeCubit(this._getHomeDataUseCase) : super(HomeInitial());
  Future<void> getHomeData() async {
    emit(HomeLoading());
    final response = await _getHomeDataUseCase.homeData();
    response.fold((error) {
      emit(HomeFailure(error));
    }, (result) {
      emit(HomeSuccess(result));
    });
  }
}
