import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCardButtom extends StatelessWidget {
  final String buttonText;
  final VoidCallback? onTap;

  const CustomCardButtom({super.key, required this.buttonText, this.onTap});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
        height: 40.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.r),
            color: theme.primaryColor),
        alignment: Alignment.center,
        child: Row(
          children: [
            const Icon(
              Icons.shopping_cart_outlined,
              color: Colors.white,
            ),
            8.horizontalSpace,
            Text(
              buttonText,
              style: theme.textTheme.bodyMedium!.copyWith(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
