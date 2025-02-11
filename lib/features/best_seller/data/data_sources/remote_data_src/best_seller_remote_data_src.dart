import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce_app/core/networking/dio/dio_factory.dart';
import 'package:e_commerce_app/features/home/data/model/home_product_model.dart';
import 'package:injectable/injectable.dart';

@injectable
class BestSellerRemoteDataSrc {
  late final Dio _dio;

  BestSellerRemoteDataSrc() {
    _dio = DioFactory.getDio();
  }
  Future<Either<String, List<HomeProductModel>>> getBestSellerData() async {
    try {
      final response = await _dio.get("/best-seller");
      if (response.statusCode == 200 && response.data != null) {
        final data = response.data["bestSeller"];
        final dataList =
            (data as List).map((e) => HomeProductModel.fromJson(e)).toList();

        return Right(dataList);
      }
      return Left(response.data["error"]);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
