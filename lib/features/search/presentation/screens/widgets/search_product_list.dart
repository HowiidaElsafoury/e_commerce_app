import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../home/domain/entities/home_product_entity.dart';
import '../../../../home/presentation/screens/widgets/home_product/home_product_item.dart';

class SearchProductList extends StatelessWidget {
  final List<HomeProductEntity> product;
  const SearchProductList({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 8.h,
        crossAxisSpacing: 8.w,
        childAspectRatio: 0.8,
      ),
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 16.h),
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) => HomeProductItem(
        product[index],
      ),
      itemCount: product.length,
    );
  }
}
