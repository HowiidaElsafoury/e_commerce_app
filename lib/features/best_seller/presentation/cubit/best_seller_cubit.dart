import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/features/best_seller/domain/use_case/get_best_seller_data_use_case.dart';
import 'package:e_commerce_app/features/home/domain/entities/home_product_entity.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'best_seller_state.dart';

@injectable
class BestSellerCubit extends Cubit<BestSellerState> {
  final GetBestSellerDataUseCase _bestSellerDataUseCase;
  BestSellerCubit(this._bestSellerDataUseCase) : super(BestSellerInitial());
  Future<void> getBestSellerData() async {
    emit(BestSellerloading());
    final response = await _bestSellerDataUseCase.bestSellerData();
    response.fold((error) => emit(BestSellerFailure(error)),
        (result) => emit(BestSellerSuccess(result)));
  }
}
