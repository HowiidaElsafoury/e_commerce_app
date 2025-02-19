import 'package:e_commerce_app/features/cart/data/models/cart_model.dart';

import '../../domain/entities/cart_response_entity.dart';

class CartResponseModel {
  final String? message;
  final int? numOfCartItems;
  final CartModel cart;

  CartResponseEntity toEntity() {
    return CartResponseEntity(
        numOfCartItems: numOfCartItems, cart: cart.toEntity());
  }

  CartResponseModel({this.message, this.numOfCartItems, required this.cart});
  factory CartResponseModel.fromJson(Map<String, dynamic> json) =>
      CartResponseModel(
        message: json["message"],
        numOfCartItems: json["numOfCartItems"],
        cart: CartModel.fromJson(json["cart"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "numOfCartItems": numOfCartItems,
        "cart": cart.toJson(),
      };
}
