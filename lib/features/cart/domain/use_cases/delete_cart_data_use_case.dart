import 'package:e_commerce_app/features/cart/domain/repo/cart_repo.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/networking/api_result.dart';
import '../entities/cart_response_entity.dart';

@injectable
class DeleteCartDataUseCase {
  final CartRepo _cartRepo;

  DeleteCartDataUseCase(this._cartRepo);
  Future<Result<CartResponseEntity>> deleteCartData(String productId) async {
    return await _cartRepo.deleteCartData(productId);
  }
}
