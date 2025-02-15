import 'package:e_commerce_app/features/layout/presentation/cubit/layout_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/app_constants/app_constants.dart';
import '../../../../../../core/shared_widgets/custom_text_button.dart';
import '../../../../domain/entities/home_category_entity.dart';
import 'home_category_item.dart';

class HomeCategoryList extends StatelessWidget {
  final List<HomeCategoryEntity> categories;
  const HomeCategoryList({
    super.key,
    required this.categories,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return SizedBox(
      height: 150.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Categories",
                  style: theme.textTheme.bodyLarge,
                ),
                CustomTextButton(
                    onTap: () =>
                        context.read<LayoutCubit>().navigateToCategoryTap(""),
                    title: "View All",
                    color: AppConstants.kprimaryColor),
              ],
            ),
          ),
          16.verticalSpace,
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) =>
                  HomeCategoryItem(categories[index]),
              itemCount: categories.length,
            ),
          ),
        ],
      ),
    );
  }
}
