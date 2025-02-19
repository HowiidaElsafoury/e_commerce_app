import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/features/cart/domain/repo/cart_repo.dart';
import 'package:injectable/injectable.dart';

import '../entities/cart_response_entity.dart';

@injectable
class GetCartDataUseCase {
  final CartRepo _cartRepo;

  GetCartDataUseCase(this._cartRepo);
  Future<Either<String, CartResponseEntity>> getCartData() async {
    return await _cartRepo.getCartData();
  }
}
