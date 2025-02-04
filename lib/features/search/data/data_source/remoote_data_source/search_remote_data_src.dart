import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce_app/core/networking/dio/dio_factory.dart';
import 'package:e_commerce_app/features/home/data/model/home_product_model.dart';
import 'package:injectable/injectable.dart';

@injectable
class SearchRemoteDataSrc {
  late final Dio _dio;

  SearchRemoteDataSrc() {
    _dio = DioFactory.getDio();
  }
  Future<Either<String, List<HomeProductModel>>> searchData(
      String query) async {
    final param = {"keyword": query};
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
