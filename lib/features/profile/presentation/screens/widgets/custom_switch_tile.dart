import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';

class CustomSwitchTile extends StatefulWidget {
  final String title;
  final String? subtitle;
  final IconData? leadingIcon;
  final IconData? trailingIcon;
  final VoidCallback? onTap;
  final TextStyle? titleStyle;
  final TextStyle? subtitleStyle;

  const CustomSwitchTile({
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
  State<CustomSwitchTile> createState() => _CustomSwitchTileState();
}

class _CustomSwitchTileState extends State<CustomSwitchTile> {
  bool isToggled = true;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.all(10.0.sp),
      child: Row(
        children: [
          FlutterSwitch(
            height: 20.0,
            width: 40.0,
            padding: 4.0,
            toggleSize: 15.0,
            borderRadius: 10.0,
            activeColor: Colors.pink,
            value: isToggled,
            onToggle: (value) {
              setState(() {
                isToggled = value;
              });
            },
          ),
          SizedBox(width: 8.w),
          Expanded(
            child: Row(
              children: [
                Text(
                  widget.title,
                  style: theme.textTheme.bodyMedium,
                ),
                const Spacer(),
                if (widget.subtitle != null)
                  Text(widget.subtitle!,
                      style: widget.subtitleStyle ??
                          const TextStyle(fontSize: 14, color: Colors.grey)),
              ],
            ),
          ),
          if (widget.subtitle == null && widget.trailingIcon != null)
            Icon(
              widget.trailingIcon,
              size: 16,
            ),
        ],
      ),
    );
  }
}
