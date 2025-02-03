import '../../domain/entities/home_product_entity.dart';

class HomeProductModel {
  String id;
  String title;
  String slug;
  String description;
  String imgCover;
  List<String> images;
  int price;
  int priceAfterDiscount;
  int quantity;
  String category;
  String occasion;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  int discount;
  int sold;
  String homeProductModelId;

  HomeProductModel({
    required this.id,
    required this.title,
    required this.slug,
    required this.description,
    required this.imgCover,
    required this.images,
    required this.price,
    required this.priceAfterDiscount,
    required this.quantity,
    required this.category,
    required this.occasion,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.discount,
    required this.sold,
    required this.homeProductModelId,
  });

  HomeProductEntity toEntity() {
    return HomeProductEntity(
        id: id,
        imgCover: imgCover,
        priceAfterDiscount: priceAfterDiscount,
        title: title);
  }

  factory HomeProductModel.fromJson(Map<String, dynamic> json) =>
      HomeProductModel(
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
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        discount: json["discount"],
        sold: json["sold"],
        homeProductModelId: json["id"],
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
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
        "discount": discount,
        "sold": sold,
        "id": homeProductModelId,
      };
}
