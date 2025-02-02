import 'package:flutter/material.dart';

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
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        height: 55,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30), color: theme.primaryColor),
        alignment: Alignment.center,
        child: Text(
          buttonText,
          style: theme.textTheme.bodyLarge!.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
