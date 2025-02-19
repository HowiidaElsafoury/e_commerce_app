import 'package:e_commerce_app/features/cart/domain/entities/cart_item_entity.dart';

class CartEntity {
  final String? user;
  final String? id;

  final double? totalPrice;

  final List<CartItemEntity> cartItems;

  CartEntity({this.user, this.id, this.totalPrice, required this.cartItems});
}
