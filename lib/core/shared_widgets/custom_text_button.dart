import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextButton extends StatelessWidget {
  final String title;
  final Color color;
  final VoidCallback? onTap;
  const CustomTextButton(
      {super.key, required this.title, required this.color, this.onTap});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: Text(
        title,
        style: GoogleFonts.inter(
          fontSize: 15,
          fontWeight: FontWeight.bold,
          color: color, // Text color
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}
