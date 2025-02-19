import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/features/cart/data/data_source/remote_data_src/cart_remote_data_src.dart';
import 'package:e_commerce_app/features/cart/domain/entities/cart_response_entity.dart';
import 'package:e_commerce_app/features/cart/domain/repo/cart_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CartRepo)
class CartRepoImpl implements CartRepo {
  final CartRemoteDataSrc _cartRemoteDataSrc;

  CartRepoImpl(this._cartRemoteDataSrc);
  @override
  Future<Either<String, CartResponseEntity>> getCartData() async {
    final response = await _cartRemoteDataSrc.getCartData();
    return response.fold(
      (error) => Left(error),
      (result) => Right(
        result.toEntity(),
      ),
    );
  }
}
