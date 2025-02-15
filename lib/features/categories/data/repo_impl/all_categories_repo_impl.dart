import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/features/categories/data/data_sources/remote_data_src/all_categories_remote_data_src.dart';
import 'package:e_commerce_app/features/categories/domain/repo/categories_repo.dart';
import 'package:e_commerce_app/features/home/domain/entities/home_category_entity.dart';
import 'package:e_commerce_app/features/home/domain/entities/home_product_entity.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CategoriesRepo)
class AllCategoriesRepoImpl implements CategoriesRepo {
  final AllCategoriesRemoteDataSrc _allCategoriesRemoteDataSrc;

  AllCategoriesRepoImpl(this._allCategoriesRemoteDataSrc);

  @override
  Future<Either<String, List<HomeCategoryEntity>>>
      getAllCategoriesData() async {
    final response = await _allCategoriesRemoteDataSrc.getAllCategoriesData();
    return response.fold(
      (error) => Left(error),
      (result) => Right(((result).categories)
              ?.map(
                (e) => e.toEntity(),
              )
              .toList() ??
          []),
    );
  }

  @override
  Future<Either<String, List<HomeProductEntity>>> getCategoryProduct(
      String categoryId) async {
    final response =
        await _allCategoriesRemoteDataSrc.getCategoryProduct(categoryId);
    return response.fold(
      (error) => Left(error),
      (result) => Right(((result))
          .map(
            (e) => e.toEntity(),
          )
          .toList()),
    );
  }
}
