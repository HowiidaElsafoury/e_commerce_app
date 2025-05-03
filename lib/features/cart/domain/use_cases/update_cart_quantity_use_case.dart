import 'package:e_commerce_app/features/cart/domain/entities/cart_response_entity.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/networking/api_result.dart';
import '../repo/cart_repo.dart';

@injectable
class UpdateCartQuantityUseCase {
  final CartRepo _cartRepo;

  UpdateCartQuantityUseCase(this._cartRepo);
  Future<Result<CartResponseEntity>> updateCartQuantity(
      String productId, int quantity) async {
    return await _cartRepo.updateCartQuantity(productId, quantity);
  }
}
