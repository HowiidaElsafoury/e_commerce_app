import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/features/product_details/domain/repo/product_details_repo.dart';
import 'package:injectable/injectable.dart';

import '../entity/product_details_entity.dart';

@injectable
class GetProductDetailsUseCase {
  final ProductDetailsRepo _productDetailsRepo;

  GetProductDetailsUseCase(this._productDetailsRepo);
  Future<Either<String, ProductEntity>> getProductDeatils(
      String productId) async {
    return await _productDetailsRepo.getProductDeatils(productId);
  }
}
