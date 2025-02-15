import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/features/home/domain/entities/home_product_entity.dart';

abstract class BestSellerRepo {
  Future<Either<String, List<HomeProductEntity>>> getBestSellerData();
}
