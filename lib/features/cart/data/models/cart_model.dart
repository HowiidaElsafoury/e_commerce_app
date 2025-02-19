import 'package:e_commerce_app/features/cart/data/models/cart_item_model.dart';

import '../../domain/entities/cart_entity.dart';

class CartModel {
  final String? user;
  final String? id;
  final num? discount;
  final num? totalPrice;
  final num? totalPriceAfterDiscount;
  final List<CartItemModel> cartItems;

  CartModel(
      {this.user,
      this.id,
      this.discount,
      this.totalPrice,
      this.totalPriceAfterDiscount,
      required this.cartItems});

  CartEntity toEntity() {
    return CartEntity(
        id: id,
        totalPrice: totalPrice?.toDouble(),
        user: user,
        cartItems: cartItems
            .map(
              (e) => e.toEntity(),
            )
            .toList());
  }

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
        user: json["user"],
        id: json["_id"],
        discount: json["discount"],
        totalPrice: json["totalPrice"],
        totalPriceAfterDiscount: json["totalPriceAfterDiscount"],
        cartItems: List<CartItemModel>.from(
            json["cartItems"].map((x) => CartItemModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "user": user,
        "_id": id,
        "discount": discount,
        "totalPrice": totalPrice,
        "totalPriceAfterDiscount": totalPriceAfterDiscount,
        "cartItems": List<dynamic>.from(cartItems.map((x) => x.toJson())),
      };
}
