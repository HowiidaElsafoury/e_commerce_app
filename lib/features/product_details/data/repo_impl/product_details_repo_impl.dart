import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entity/product_details_entity.dart';
import '../../domain/repo/product_details_repo.dart';
import '../data_sources/remote_data_sources/product_details_remote_data_src.dart';

@Injectable(as: ProductDetailsRepo)
class ProductDetailsRepoImpl implements ProductDetailsRepo {
  final ProductDetailsRemoteDataSrc _productDetailsRemoteDataSrc;

  ProductDetailsRepoImpl(this._productDetailsRemoteDataSrc);
  @override
  Future<Either<String, ProductEntity>> getProductDeatils(
      String productId) async {
    final response =
        await _productDetailsRemoteDataSrc.getProductDeatils(productId);
    return response.fold(
      (error) => Left(error),
      (result) => Right((result).product.toEntity()),
    );
  }
}
