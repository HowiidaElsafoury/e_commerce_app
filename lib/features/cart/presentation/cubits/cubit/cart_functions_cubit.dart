import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/core/networking/api_result.dart';
import 'package:e_commerce_app/features/cart/domain/use_cases/delete_cart_data_use_case.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../domain/use_cases/update_cart_quantity_use_case.dart';

part 'cart_functions_state.dart';

@injectable
class CartFunctionsCubit extends Cubit<CartFunctionsState> {
  final UpdateCartQuantityUseCase _updateCart;

  final DeleteCartDataUseCase _deleteCart;
  CartFunctionsCubit(this._updateCart, this._deleteCart)
      : super(CartFunctionsInitial());

  Future<void> updateCartData(String productId, int quantity) async {
    emit(CartUpdateLoading());
    final response = await _updateCart.updateCartQuantity(productId, quantity);
    switch (response) {
      case Success():
        emit(CartUpdateSuccess());

      case Error():
        emit(CartUpdateFailure(response.exception.toString()));
    }
    // response.fold(
    //   (error) => emit(CartUpdateFailure(error)),
    //   (result) => emit(
    //     CartUpdateSuccess(),
    //   ),
    // );
  }

  Future<void> deleteCartData(String productId) async {
    emit(CartDeleteLoading());
    final response = await _deleteCart.deleteCartData(productId);
    switch (response) {
      case Success():
        emit(CartDeleteSuccess());

      case Error():
        emit(CartDeleteFailure(response.exception.toString()));
    }
  }
}
