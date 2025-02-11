import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/features/best_seller/data/data_sources/remote_data_src/best_seller_remote_data_src.dart';
import 'package:e_commerce_app/features/best_seller/domain/repo/best_seller_repo.dart';
import 'package:e_commerce_app/features/home/domain/entities/home_product_entity.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: BestSellerRepo)
class BestSellerRepoImpl implements BestSellerRepo {
  final BestSellerRemoteDataSrc _bestSellerRemoteDataSrc;

  BestSellerRepoImpl(this._bestSellerRemoteDataSrc);

  @override
  Future<Either<String, List<HomeProductEntity>>> getBestSellerData() async {
    final response = await _bestSellerRemoteDataSrc.getBestSellerData();
    return response.fold(
      (error) => Left(error),
      (result) => Right(
        (result)
            .map(
              (e) => e.toEntity(),
            )
            .toList(),
      ),
    );
  }
}
