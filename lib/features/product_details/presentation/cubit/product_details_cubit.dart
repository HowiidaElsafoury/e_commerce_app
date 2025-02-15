import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/features/product_details/domain/entity/product_details_entity.dart';
import 'package:e_commerce_app/features/product_details/domain/use_cas/get_product-details_use_case.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'product_details_state.dart';

@injectable
class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  final GetProductDetailsUseCase getProductDetailsUseCase;
  ProductDetailsCubit(this.getProductDetailsUseCase)
      : super(ProductDetailsInitial());

  Future<void> getProductDeatils(String productId) async {
    emit(ProductDetailsLoading());
    final response =
        await getProductDetailsUseCase.getProductDeatils(productId);
    response.fold(
      (error) => Left(
        emit(
          ProductDetailsFailure(error),
        ),
      ),
      (result) => Right(
        emit(
          ProductDetailsSuccess(result),
        ),
      ),
    );
  }
}
