import 'package:e_commerce_app/core/shared_widgets/product_card_with_list/product_card_item.dart';
import 'package:e_commerce_app/features/home/domain/entities/home_product_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductCardList extends StatelessWidget {
  final List<HomeProductEntity> product;

  const ProductCardList({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 8.h,
        crossAxisSpacing: 8.w,
        childAspectRatio: 0.7,
      ),
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 16.h),
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) => ProductCardItem(
        bestSellerProduct: product[index],
      ),
      itemCount: product.length,
    );
  }
}
