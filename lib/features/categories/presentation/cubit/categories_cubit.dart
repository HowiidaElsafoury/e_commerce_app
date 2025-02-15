import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/features/categories/domain/use_cases/get_category_product_use_case.dart';
import 'package:e_commerce_app/features/categories/domain/use_cases/get_category_use_case.dart';
import 'package:e_commerce_app/features/home/domain/entities/home_category_entity.dart';
import 'package:e_commerce_app/features/home/domain/entities/home_product_entity.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

part 'categories_state.dart';

@injectable
class CategoriesCubit extends Cubit<CategoriesState> {
  final GetCategoryUseCase _getCategoryUseCase;
  final GetCategoryProductUseCase _getCategoryProductUseCase;

  CategoriesCubit(this._getCategoryUseCase, this._getCategoryProductUseCase)
      : super(CategoriesInitial());
  late final TabController controller;

  Future<void> getAllCategoriesData({String? categoryId}) async {
    emit(CategoriesLoading());
    final response = await _getCategoryUseCase.getCategories();
    response.fold((error) => emit(CategoriesFailure(error)), (result) {
      emit(
        CategoriesSuccess(result),
      );
      if (categoryId == null || categoryId.isEmpty) {
        getCategoryProduct(result.first.id ?? "");
      } else {
        getCategoryProduct(categoryId);
      }
    });
  }

  Future<void> getCategoryProduct(String categoryId) async {
    emit(CategoriesProductLoading());
    final response =
        await _getCategoryProductUseCase.getCategoryProduct(categoryId);
    response.fold(
      (error) => emit(CategoriesProductFailure(error)),
      (result) => emit(
        CategoriesProductSuccess(result),
      ),
    );
  }
}
