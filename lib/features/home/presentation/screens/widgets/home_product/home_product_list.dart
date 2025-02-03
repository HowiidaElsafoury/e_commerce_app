import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/app_constants/app_constants.dart';
import '../../../../../../core/shared_widgets/custom_text_button.dart';
import '../../../../domain/entities/home_product_entity.dart';
import 'home_product_item.dart';

class HomeProductList extends StatelessWidget {
  final List<HomeProductEntity> bestSeller;
  const HomeProductList({
    super.key,
    required this.bestSeller,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return SizedBox(
      height: 260.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Best Seller",
                  style: theme.textTheme.bodyLarge,
                ),
                CustomTextButton(
                    title: "View All", color: AppConstants.kprimaryColor),
              ],
            ),
          ),
          16.verticalSpace,
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => HomeProductItem(
                bestSeller[index],
              ),
              itemCount: bestSeller.length,
            ),
          ),
        ],
      ),
    );
  }
}
