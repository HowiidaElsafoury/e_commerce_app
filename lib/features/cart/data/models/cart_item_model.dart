import '../../../home/data/model/home_product_model.dart';
import '../../domain/entities/cart_item_entity.dart';

class CartItemModel {
  final HomeProductModel product;
  final num? price;
  final int? quantity;
  final String? id;

  CartItemModel({required this.product, this.price, this.quantity, this.id});

  CartItemEntity toEntity() {
    return CartItemEntity(
        id: id,
        price: price?.toDouble(),
        quantity: quantity,
        product: product.toEntity());
  }

  factory CartItemModel.fromJson(Map<String, dynamic> json) => CartItemModel(
        product: HomeProductModel.fromJson(json["product"]),
        price: json["price"],
        quantity: json["quantity"],
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "product": product.toJson(),
        "price": price,
        "quantity": quantity,
        "_id": id,
      };
}
