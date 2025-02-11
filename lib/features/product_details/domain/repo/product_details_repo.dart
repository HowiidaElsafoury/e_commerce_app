import 'package:dartz/dartz.dart';

import '../entity/product_details_entity.dart';

abstract class ProductDetailsRepo {
  Future<Either<String, ProductEntity>> getProductDeatils(String productId);
}
