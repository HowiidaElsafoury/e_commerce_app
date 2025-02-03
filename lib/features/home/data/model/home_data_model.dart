import '../../domain/entities/home_data_entity.dart';
import 'home_category_model.dart';
import 'home_product_model.dart';

class HomeDataModel {
  final String? message;
  final List<HomeCategoryModel>? categories;
  final List<HomeProductModel>? bestSeller;
  final List<HomeCategoryModel>? occasions;

  HomeDataModel(
      {this.message, this.categories, this.bestSeller, this.occasions});
  factory HomeDataModel.fromJson(Map<String, dynamic> json) {
    return HomeDataModel(
      message: json["message"],
      categories: (json["categories"] as List)
          .map((e) => HomeCategoryModel.fromJson(e))
          .toList(),
      bestSeller: (json["bestSeller"] as List)
          .map((e) => HomeProductModel.fromJson(e))
          .toList(),
      occasions: (json["occasions"] as List)
          .map((e) => HomeCategoryModel.fromJson(e))
          .toList(),
    );
  }
  HomeDataEntity toEntity() {
    return HomeDataEntity(
      categories?.map((e) => e.toEntity()).toList() ?? [],
      bestSeller?.map((e) => e.toEntity()).toList() ?? [],
      occasions?.map((e) => e.toEntity()).toList() ?? [],
    );
  }
}
