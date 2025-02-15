import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/features/home/domain/entities/home_product_entity.dart';
import 'package:injectable/injectable.dart';

import '../repo/categories_repo.dart';

@injectable
class GetCategoryProductUseCase {
  final CategoriesRepo _categoriesRepo;

  GetCategoryProductUseCase(this._categoriesRepo);
  Future<Either<String, List<HomeProductEntity>>> getCategoryProduct(
      String catergoryId) async {
    return await _categoriesRepo.getCategoryProduct(catergoryId);
  }
}
