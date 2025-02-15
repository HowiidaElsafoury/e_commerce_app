part of 'categories_cubit.dart';

@immutable
sealed class CategoriesState {}

final class CategoriesInitial extends CategoriesState {}

final class CategoriesSuccess extends CategoriesState {
  final List<HomeCategoryEntity> allCategories;

  CategoriesSuccess(this.allCategories);
}

final class CategoriesLoading extends CategoriesState {}

final class CategoriesFailure extends CategoriesState {
  final String message;

  CategoriesFailure(this.message);
}

final class CategoriesProductSuccess extends CategoriesState {
  final List<HomeProductEntity> data;

  CategoriesProductSuccess(this.data);
}

final class CategoriesProductLoading extends CategoriesState {}

final class CategoriesProductFailure extends CategoriesState {
  final String message;

  CategoriesProductFailure(this.message);
}
