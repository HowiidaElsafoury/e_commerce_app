import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/app_constants/app_constants.dart';
import '../../../../domain/entities/home_category_entity.dart';

class HomeCategoryItem extends StatelessWidget {
  final HomeCategoryEntity category;

  const HomeCategoryItem(this.category, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          color: AppConstants.kpinkColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 22),
            child: Image.network(
              category.image ?? "",
              width: 24.w,
              height: 24.h,
              fit: BoxFit.contain,
            ),
          ),
        ),
        Text(category.name ?? ""),
      ],
    );
  }
}
