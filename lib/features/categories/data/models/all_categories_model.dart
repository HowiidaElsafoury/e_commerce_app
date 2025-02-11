import '../../../home/data/model/home_category_model.dart';

class AllCategoriesModel {
  final String? message;
  final List<HomeCategoryModel>? categories;

  AllCategoriesModel({this.message, this.categories});
  factory AllCategoriesModel.fromJson(Map<String, dynamic> json) {
    return AllCategoriesModel(
      message: json["message"],
      categories: (json["categories"] as List)
          .map((e) => HomeCategoryModel.fromJson(e))
          .toList(),
    );
  }
}
