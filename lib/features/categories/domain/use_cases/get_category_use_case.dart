import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/features/categories/domain/repo/categories_repo.dart';
import 'package:e_commerce_app/features/home/domain/entities/home_category_entity.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetCategoryUseCase {
  final CategoriesRepo _categoriesRepo;

  GetCategoryUseCase(this._categoriesRepo);
  Future<Either<String, List<HomeCategoryEntity>>> getCategories() async {
    return await _categoriesRepo.getAllCategoriesData();
  }
}
