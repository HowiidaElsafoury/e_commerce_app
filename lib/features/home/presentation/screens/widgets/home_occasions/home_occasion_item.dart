import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../domain/entities/home_category_entity.dart';

class HomeOccasionItem extends StatelessWidget {
  final HomeCategoryEntity occasions;
  const HomeOccasionItem(this.occasions, {super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.only(right: 16.0.w),
      child: Column(
        children: [
          Image.network(
            occasions.image ?? "",
            width: 131.w,
            height: 151.h,
            fit: BoxFit.cover,
          ),
          8.verticalSpace,
          Text(occasions.name ?? '', style: theme.textTheme.bodyMedium),
        ],
      ),
    );
  }
}
