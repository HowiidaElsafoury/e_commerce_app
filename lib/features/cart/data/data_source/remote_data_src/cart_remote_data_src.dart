import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce_app/core/networking/dio/dio_factory.dart';
import 'package:e_commerce_app/features/cart/data/models/cart_response_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/app_constants/app_constants.dart';

@injectable
class CartRemoteDataSrc {
  late final Dio _dio;
  CartRemoteDataSrc() {
    _dio = DioFactory.getDio();
  }

  Future<Either<String, CartResponseModel>> getCartData() async {
    try {
      const storage = FlutterSecureStorage();

      final String token = await storage.read(key: AppConstants.tokenSPK) ?? "";
      final Map<String, dynamic> headers = {"Authorization": "Bearer $token"};
      final response = await _dio.get(
        "/cart",
        options: Options(headers: headers),
      );
      if (response.statusCode == 200 && response.data != null) {
        final data = CartResponseModel.fromJson(response.data);
        return Right(data);
      } else {
        return Left(response.data["error"]);
      }
    } catch (e) {
      return Left(e.toString());
    }
  }
}
