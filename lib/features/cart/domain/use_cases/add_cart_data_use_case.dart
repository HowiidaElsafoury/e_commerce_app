import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../entities/cart_response_entity.dart';
import '../repo/cart_repo.dart';

@injectable
class AddCartDataUseCase {
  final CartRepo _cartRepo;

  AddCartDataUseCase(this._cartRepo);
  Future<Either<String, CartResponseEntity>> addCartData(
      String productId, int quantity) async {
    return await _cartRepo.addCartData(productId, quantity);
  }
}
