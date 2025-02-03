import 'package:e_commerce_app/features/home/domain/entities/home_data_entity.dart';
import 'package:e_commerce_app/features/home/presentation/screens/widgets/home_category/home_category_list.dart';
import 'package:e_commerce_app/features/home/presentation/screens/widgets/home_occasions/home_occasion_list.dart';
import 'package:e_commerce_app/features/home/presentation/screens/widgets/home_product/home_product_list.dart';
import 'package:flutter/material.dart';

class HomeDataList extends StatelessWidget {
  final HomeDataEntity data;
  const HomeDataList({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HomeCategoryList(categories: data.categories ?? []),
        HomeProductList(bestSeller: data.bestSellers ?? []),
        HomeOccasionList(occasions: data.occasions ?? []),
      ],
    );
  }
}
