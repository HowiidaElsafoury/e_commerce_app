import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/core/networking/api_result.dart';
import 'package:e_commerce_app/features/cart/domain/entities/cart_response_entity.dart';
import 'package:e_commerce_app/features/cart/domain/use_cases/add_cart_data_use_case.dart';
import 'package:e_commerce_app/features/cart/domain/use_cases/get_cart_data_use_case.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'cart_state.dart';

@injectable
class CartCubit extends Cubit<CartState> {
  final GetCartDataUseCase _cartDataUseCase;
  final AddCartDataUseCase _addCartDataUseCase;
  CartCubit(this._cartDataUseCase, this._addCartDataUseCase)
      : super(CartInitial());
  CartResponseEntity? cart;
  Future<void> getCartData() async {
    emit(CartLoading());
    final response = await _cartDataUseCase.getCartData();
    switch (response) {
      case Success():
        if (response.data?.numOfCartItems == 0) {
          emit(CartEmpty());
        } else {
          emit(CartSuccess(response.data));
        }

      case Error():
        emit(CartFailure(response.exception.toString()));
    }
    // response.fold(
    //     (error) => emit(
    //           CartFailure(error),
    //         ), (result) {
    //   cart = result;
    //   if (result.numOfCartItems == 0) {
    //     emit(CartEmpty());
    //   } else {
    //     emit(CartSuccess(result));
    //   }
    // });
  }

  Future<void> addCartData(String productId, int quantity) async {
    emit(AddCartLoading(productId));
    final response = await _addCartDataUseCase.addCartData(productId, quantity);
    switch (response) {
      case Success():
        emit(AddCartSuccess());
        getCartData();

      case Error():
        emit(AddCartFailure(response.exception.toString()));
    }
    // response.fold(
    //     (error) => emit(
    //           AddCartFailure(error),
    //         ), (result) {
    //   emit(
    //     AddCartSuccess(),
    //   );
    //   getCartData();
    // });
  }
}
