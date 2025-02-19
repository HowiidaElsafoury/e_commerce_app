import '../../../home/domain/entities/home_product_entity.dart';

class CartItemEntity {
  final HomeProductEntity product;
  final double? price;
  final int? quantity;
  final String? id;

  CartItemEntity({required this.product, this.price, this.quantity, this.id});
}
