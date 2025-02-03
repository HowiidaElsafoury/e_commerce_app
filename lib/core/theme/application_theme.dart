import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../app_constants/app_constants.dart';

class ApplicationTheme {
  static ThemeData lightTheme = ThemeData(
    primaryColor: AppConstants.kprimaryColor,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      toolbarHeight: 72.h,
      centerTitle: false,
    ),
    textTheme: TextTheme(
        titleLarge: GoogleFonts.inter(
          fontSize: 30,
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
        bodyLarge: GoogleFonts.inter(
          fontWeight: FontWeight.w500,
          fontSize: 18,
          color: Colors.black,
        ),
        bodyMedium: GoogleFonts.inter(
          fontSize: 15,
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
        bodySmall: GoogleFonts.inter(
          fontSize: 12,
          fontWeight: FontWeight.normal,
          color: Colors.black,
        )),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedIconTheme:
            IconThemeData(color: AppConstants.kprimaryColor, size: 24),
        selectedItemColor: AppConstants.kprimaryColor,
        unselectedIconTheme: const IconThemeData(
          color: Color(0xFF7D7D7D),
        ),
        unselectedItemColor: const Color(0xFF7D7D7D)),
  );
}
