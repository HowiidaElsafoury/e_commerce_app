import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/features/home/domain/entities/home_category_entity.dart';
import 'package:e_commerce_app/features/home/domain/entities/home_product_entity.dart';

abstract class CategoriesRepo {
  Future<Either<String, List<HomeCategoryEntity>>> getAllCategoriesData();
  Future<Either<String, List<HomeProductEntity>>> getCategoryProduct(
      String catergoryId);
}
