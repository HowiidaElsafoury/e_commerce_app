import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/features/cart/domain/entities/cart_response_entity.dart';
import 'package:e_commerce_app/features/cart/domain/use_cases/get_cart_data_use_case.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'cart_state.dart';

@injectable
class CartCubit extends Cubit<CartState> {
  final GetCartDataUseCase _cartDataUseCase;
  CartCubit(this._cartDataUseCase) : super(CartInitial());
  CartResponseEntity? cart;
  Future<void> getCartData() async {
    emit(CartLoading());
    final response = await _cartDataUseCase.getCartData();
    response.fold(
        (error) => Left(
              emit(
                CartFailure(error),
              ),
            ), (result) {
      cart = result;
      if (result.numOfCartItems == 0) {
        emit(CartEmpty());
      } else {
        emit(CartSuccess(result));
      }
    });
  }
}
