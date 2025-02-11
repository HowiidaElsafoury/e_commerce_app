import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce_app/core/networking/dio/dio_factory.dart';
import 'package:e_commerce_app/features/categories/data/models/all_categories_model.dart';
import 'package:injectable/injectable.dart';

import '../../../../home/data/model/home_product_model.dart';

@injectable
class AllCategoriesRemoteDataSrc {
  late final Dio _dio;

  AllCategoriesRemoteDataSrc() {
    _dio = DioFactory.getDio();
  }
  Future<Either<String, AllCategoriesModel>> getAllCategoriesData() async {
    try {
      final response = await _dio.get("/categories");
      if (response.statusCode == 200 && response.data != null) {
        final data = AllCategoriesModel.fromJson(response.data);
        return Right(data);
      } else {
        return Left(response.data["error"]);
      }
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, List<HomeProductModel>>> getCategoryProduct(
      String categoryId) async {
    final param = {"category": categoryId};
    try {
      final response = await _dio.get("/products", queryParameters: param);
      if (response.statusCode == 200 && response.data != null) {
        final data = response.data["products"];
        final dataList =
            (data as List).map((e) => HomeProductModel.fromJson(e)).toList();
        return Right(dataList);
      } else {
        return Left(response.data["error"]);
      }
    } catch (e) {
      return Left(e.toString());
    }
  }
}
