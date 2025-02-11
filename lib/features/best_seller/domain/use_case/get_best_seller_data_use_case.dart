import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/features/best_seller/domain/repo/best_seller_repo.dart';
import 'package:e_commerce_app/features/home/domain/entities/home_product_entity.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetBestSellerDataUseCase {
  final BestSellerRepo _bestSellerRepo;

  GetBestSellerDataUseCase(this._bestSellerRepo);
  Future<Either<String, List<HomeProductEntity>>> bestSellerData() async {
    return await _bestSellerRepo.getBestSellerData();
  }
}
