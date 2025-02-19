import 'package:e_commerce_app/features/cart/domain/entities/cart_entity.dart';

class CartResponseEntity {
  final int? numOfCartItems;
  final CartEntity cart;

  CartResponseEntity({this.numOfCartItems, required this.cart});
}
