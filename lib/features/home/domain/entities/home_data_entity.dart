import 'package:e_commerce_app/features/home/domain/entities/home_category_entity.dart';
import 'package:e_commerce_app/features/home/domain/entities/home_product_entity.dart';

class HomeDataEntity {
  final List<HomeCategoryEntity>? categories;
  final List<HomeProductEntity>? bestSellers;
  final List<HomeCategoryEntity>? occasions;

  HomeDataEntity(this.categories, this.bestSellers, this.occasions);
}
