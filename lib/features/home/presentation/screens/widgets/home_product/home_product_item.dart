import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../domain/entities/home_product_entity.dart';

class HomeProductItem extends StatelessWidget {
  final HomeProductEntity homeProduct;
  const HomeProductItem(this.homeProduct, {super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.only(right: 16.w),
      child: Column(
        children: [
          Image.network(
            homeProduct.imgCover ?? "",
            width: 131.h,
            height: 151.h,
            fit: BoxFit.cover,
          ),
          8.verticalSpace,
          Text(homeProduct.title ?? '', style: theme.textTheme.bodySmall),
          Text('${homeProduct.priceAfterDiscount} EGP',
              style: theme.textTheme.bodyMedium),
        ],
      ),
    );
  }
}
