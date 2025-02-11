import 'package:e_commerce_app/core/shared_widgets/product_card_with_list/product_card_list.dart';
import 'package:e_commerce_app/features/categories/presentation/screens/categories_app_bar.dart';
import 'package:e_commerce_app/features/layout/presentation/cubit/layout_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../cubit/categories_cubit.dart';

class CategoriesView extends StatefulWidget {
  static const String routeName = "category view";
  final String? categoryId;

  const CategoriesView({super.key, this.categoryId});

  @override
  State<CategoriesView> createState() => _CategoriesViewState();
}

class _CategoriesViewState extends State<CategoriesView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    context.read<CategoriesCubit>().getAllCategoriesData(
        categoryId: context.read<LayoutCubit>().selectedCategoryId);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CategoriesAppBar(),
        body: Column(
          children: [
            BlocBuilder<CategoriesCubit, CategoriesState>(
              buildWhen: (previous, current) {
                if (current is CategoriesLoading ||
                    current is CategoriesFailure ||
                    current is CategoriesSuccess) {
                  return true;
                } else {
                  return false;
                }
              },
              builder: (context, state) {
                if (state is CategoriesLoading) {
                  return const CircularProgressIndicator();
                } else if (state is CategoriesFailure) {
                  return Text(state.message);
                } else if (state is CategoriesSuccess) {
                  return DefaultTabController(
                    initialIndex: context
                            .read<LayoutCubit>()
                            .selectedCategoryId
                            .isNotEmpty
                        ? state.allCategories.indexWhere(
                            (e) =>
                                e.id ==
                                context.read<LayoutCubit>().selectedCategoryId,
                          )
                        : 0,
                    length: state.allCategories.length,
                    child: Column(
                      children: [
                        TabBar(
                            onTap: (value) => context
                                .read<CategoriesCubit>()
                                .getCategoryProduct(
                                    state.allCategories[value].id ?? ""),
                            isScrollable: true,
                            tabs: state.allCategories
                                .map(
                                  (e) => Tab(
                                    text: e.name,
                                  ),
                                )
                                .toList()),
                        24.verticalSpace,
                        BlocBuilder<CategoriesCubit, CategoriesState>(
                          buildWhen: (previous, current) {
                            if (current is CategoriesProductLoading ||
                                current is CategoriesProductFailure ||
                                current is CategoriesProductSuccess) {
                              return true;
                            } else {
                              return false;
                            }
                          },
                          builder: (context, state) {
                            if (state is CategoriesProductLoading) {
                              return const CircularProgressIndicator();
                            } else if (state is CategoriesProductFailure) {
                              return Text(state.message);
                            } else if (state is CategoriesProductSuccess) {
                              return SizedBox(
                                  height: 0.7.sh,
                                  child: ProductCardList(product: state.data));
                            } else {
                              return const SizedBox();
                            }
                          },
                        )
                      ],
                    ),
                  );
                } else {
                  return const SizedBox();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
