import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce_app/core/networking/dio/dio_factory.dart';
import 'package:injectable/injectable.dart';

import '../../model/home_data_model.dart';

@injectable
class HomeDataRemoteDataSrc {
  late final Dio _dio;

  HomeDataRemoteDataSrc() {
    _dio = DioFactory.getDio();
  }
  Future<Either<String, HomeDataModel>> getHomeData() async {
    try {
      final response = await _dio.get("/home");
      if (response.statusCode == 200 && response.data != null) {
        final data = HomeDataModel.fromJson(response.data);
        return Right(data);
      } else {
        return Left(response.data["error"]);
      }
    } catch (e) {
      return Left(e.toString());
    }
  }
}
