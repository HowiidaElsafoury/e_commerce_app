import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/app_constants/app_constants.dart';
import '../../../../../../core/shared_widgets/custom_text_button.dart';
import '../../../../domain/entities/home_category_entity.dart';
import 'home_occasion_item.dart';

class HomeOccasionList extends StatelessWidget {
  final List<HomeCategoryEntity> occasions;
  const HomeOccasionList({
    super.key,
    required this.occasions,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return SizedBox(
      height: 250.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Occasions",
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
              itemBuilder: (context, index) => HomeOccasionItem(
                occasions[index],
              ),
              itemCount: occasions.length,
            ),
          ),
        ],
      ),
    );
  }
}
