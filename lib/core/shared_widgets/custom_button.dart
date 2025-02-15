import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback? onTap;
  const CustomButton({super.key, required this.buttonText, this.onTap});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
        height: 55.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.r),
            color: theme.primaryColor),
        alignment: Alignment.center,
        child: Text(
          buttonText,
          style: theme.textTheme.bodyLarge!.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
