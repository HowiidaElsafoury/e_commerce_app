import 'package:e_commerce_app/features/cart/data/data_source/remote_data_src/cart_remote_data_src.dart';
import 'package:e_commerce_app/features/cart/domain/entities/cart_response_entity.dart';
import 'package:e_commerce_app/features/cart/domain/repo/cart_repo.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/networking/api_result.dart';

@Injectable(as: CartRepo)
class CartRepoImpl implements CartRepo {
  final CartRemoteDataSrc _cartRemoteDataSrc;

  CartRepoImpl(this._cartRemoteDataSrc);
  @override
  Future<Result<CartResponseEntity>> getCartData() async {
    final response = await _cartRemoteDataSrc.getCartData();
    switch (response) {
      case Success():
        return Success(data: response.data?.toEntity());

      case Error():
        return Error(exception: response.exception);
    }
  }

  @override
  Future<Result<CartResponseEntity>> addCartData(
      String productId, int quantity) async {
    final response = await _cartRemoteDataSrc.addCartData(productId, quantity);
    switch (response) {
      case Success():
        return Success(data: response.data?.toEntity());

      case Error():
        return Error(exception: response.exception);
    }
  }

  @override
  Future<Result<CartResponseEntity>> updateCartQuantity(
      String productId, int quantity) async {
    final response =
        await _cartRemoteDataSrc.updateCartQuantity(productId, quantity);
    switch (response) {
      case Success():
        return Success(data: response.data?.toEntity());

      case Error():
        return Error(exception: response.exception);
    }
  }

  @override
  Future<Result<CartResponseEntity>> deleteCartData(String productId) async {
    final response = await _cartRemoteDataSrc.deleteCartData(productId);
    switch (response) {
      case Success():
        return Success(data: response.data?.toEntity());

      case Error():
        return Error(exception: response.exception);
    }
  }
}
