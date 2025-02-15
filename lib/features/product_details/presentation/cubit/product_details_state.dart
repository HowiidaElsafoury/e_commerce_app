part of 'product_details_cubit.dart';

@immutable
sealed class ProductDetailsState {}

final class ProductDetailsInitial extends ProductDetailsState {}

final class ProductDetailsSuccess extends ProductDetailsState {
  final ProductEntity productEntity;

  ProductDetailsSuccess(this.productEntity);
}

final class ProductDetailsLoading extends ProductDetailsState {}

final class ProductDetailsFailure extends ProductDetailsState {
  final String message;
  ProductDetailsFailure(this.message);
}
