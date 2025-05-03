import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomListTile extends StatelessWidget {
  final String title;
  final String? subtitle;
  final IconData? leadingIcon;
  final IconData? trailingIcon;
  final VoidCallback? onTap;
  final TextStyle? titleStyle;
  final TextStyle? subtitleStyle;

  const CustomListTile({
    super.key,
    required this.title,
    this.subtitle,
    this.leadingIcon,
    this.trailingIcon,
    this.onTap,
    this.titleStyle,
    this.subtitleStyle,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      child: GestureDetector(
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.all(10.sp),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              if (leadingIcon != null)
                Icon(
                  leadingIcon,
                  size: 20.sp,
                ),
              SizedBox(width: 8.w),
              Expanded(
                child: Row(
                  children: [
                    Text(
                      title,
                      style: theme.textTheme.bodyMedium,
                    ),
                    const Spacer(),
                    if (subtitle != null)
                      Text(subtitle!,
                          style: subtitleStyle ??
                              const TextStyle(
                                  fontSize: 14, color: Colors.grey)),
                  ],
                ),
              ),
              if (subtitle == null && trailingIcon != null)
                Icon(
                  trailingIcon,
                  size: 18,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
