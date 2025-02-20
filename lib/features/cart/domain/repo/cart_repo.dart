import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/features/cart/domain/entities/cart_response_entity.dart';

abstract class CartRepo {
  Future<Either<String, CartResponseEntity>> getCartData();
  Future<Either<String, CartResponseEntity>> addCartData(
      String productId, int quantity);
}
