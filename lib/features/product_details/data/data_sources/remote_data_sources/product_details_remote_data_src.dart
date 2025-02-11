import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce_app/core/networking/dio/dio_factory.dart';
import 'package:e_commerce_app/features/product_details/data/models/product_details_model.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProductDetailsRemoteDataSrc {
  late final Dio _dio;

  ProductDetailsRemoteDataSrc() {
    _dio = DioFactory.getDio();
  }
  Future<Either<String, ProductDetailsModel>> getProductDeatils(
      String productId) async {
    try {
      final response = await _dio.get("/products/$productId");
      if (response.statusCode == 200 && response.data != null) {
        final data = ProductDetailsModel.fromJson(response.data);
        return Right(data);
      } else {
        return Left(response.data["error"]);
      }
    } catch (e) {
      return Left(e.toString());
    }
  }
}
