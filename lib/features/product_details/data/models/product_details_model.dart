import 'package:e_commerce_app/features/product_details/domain/entity/product_details_entity.dart';

class ProductDetailsModel {
  final String? message;
  final Product product;

  ProductDetailsModel({
    required this.message,
    required this.product,
  });

  factory ProductDetailsModel.fromJson(Map<String, dynamic> json) =>
      ProductDetailsModel(
        message: json["message"],
        product: Product.fromJson(json["product"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "product": product.toJson(),
      };
}

class Product {
  final String? id;
  final String? title;
  final String? slug;
  final String? description;
  final String? imgCover;
  final List<String> images;
  final int price;
  final int priceAfterDiscount;
  final int? quantity;
  final String? category;
  final String? occasion;
  final String? createdAt;
  final String? updatedAt;
  final int? v;
  final int? discount;
  final int? sold;
  final String? productId;

  Product({
    this.id,
    this.title,
    this.slug,
    this.description,
    this.imgCover,
    required this.images,
    required this.price,
    required this.priceAfterDiscount,
    this.quantity,
    this.category,
    this.occasion,
    required this.createdAt,
    required this.updatedAt,
    this.v,
    this.discount,
    this.sold,
    this.productId,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["_id"],
        title: json["title"],
        slug: json["slug"],
        description: json["description"],
        imgCover: json["imgCover"],
        images: List<String>.from(json["images"].map((x) => x)),
        price: json["price"],
        priceAfterDiscount: json["priceAfterDiscount"],
        quantity: json["quantity"],
        category: json["category"],
        occasion: json["occasion"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
        v: json["__v"],
        discount: json["discount"],
        sold: json["sold"],
        productId: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "slug": slug,
        "description": description,
        "imgCover": imgCover,
        "images": List<dynamic>.from(images.map((x) => x)),
        "price": price,
        "priceAfterDiscount": priceAfterDiscount,
        "quantity": quantity,
        "category": category,
        "occasion": occasion,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "__v": v,
        "discount": discount,
        "sold": sold,
        "id": productId,
      };
  ProductEntity toEntity() {
    return ProductEntity(
        price: price,
        priceAfterDiscount: priceAfterDiscount,
        category: category,
        createdAt: createdAt,
        updatedAt: updatedAt,
        description: description,
        discount: discount,
        id: id,
        images: images,
        imgCover: imgCover,
        occasion: occasion,
        quantity: quantity,
        slug: slug,
        title: title,
        v: v);
  }
}
