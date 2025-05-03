import 'package:e_commerce_app/features/cart/domain/entities/cart_response_entity.dart';

import '../../../../core/networking/api_result.dart';

abstract class CartRepo {
  Future<Result<CartResponseEntity>> getCartData();
  Future<Result<CartResponseEntity>> addCartData(
      String productId, int quantity);
  Future<Result<CartResponseEntity>> updateCartQuantity(
      String productId, int quantity);
  Future<Result<CartResponseEntity>> deleteCartData(String productId);
}
