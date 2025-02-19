part of 'cart_cubit.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {}

final class CartSuccess extends CartState {
  final CartResponseEntity cartResponseEntity;

  CartSuccess(this.cartResponseEntity);
}

final class CartLoading extends CartState {}

final class CartEmpty extends CartState {}

final class CartFailure extends CartState {
  final String message;
  CartFailure(this.message);
}
