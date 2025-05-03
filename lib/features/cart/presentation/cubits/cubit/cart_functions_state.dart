part of 'cart_functions_cubit.dart';

@immutable
sealed class CartFunctionsState {}

final class CartFunctionsInitial extends CartFunctionsState {}

final class CartUpdateSuccess extends CartFunctionsState {}

final class CartUpdateLoading extends CartFunctionsState {}

final class CartUpdateFailure extends CartFunctionsState {
  final String message;
  CartUpdateFailure(this.message);
}

final class CartDeleteSuccess extends CartFunctionsState {}

final class CartDeleteLoading extends CartFunctionsState {}

final class CartDeleteFailure extends CartFunctionsState {
  final String message;
  CartDeleteFailure(this.message);
}
