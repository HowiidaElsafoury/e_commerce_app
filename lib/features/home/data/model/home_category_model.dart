import '../../domain/entities/home_category_entity.dart';

class HomeCategoryModel {
  final String? id;
  final String? name;
  final String? slug;
  final String? image;
  final String? createdAt;
  final String? updatedAt;

  HomeCategoryModel({
    this.id,
    this.name,
    this.slug,
    this.image,
    this.createdAt,
    this.updatedAt,
  });
  HomeCategoryEntity toEntity() {
    return HomeCategoryEntity(id: id, name: name, image: image);
  }

  factory HomeCategoryModel.fromJson(Map<String, dynamic> json) =>
      HomeCategoryModel(
        id: json["_id"],
        name: json["name"],
        slug: json["slug"],
        image: json["image"],
        createdAt: (json["createdAt"]),
        updatedAt: (json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "slug": slug,
        "image": image,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
      };
}
