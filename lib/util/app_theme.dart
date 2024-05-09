import 'package:flutter/material.dart';
import 'package:frontier_homepage/util/appcolor.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData light = ThemeData(
    textTheme: TextTheme(
      bodyLarge: TextStyle(
        fontFamily: GoogleFonts.poppins().fontFamily,
        fontSize: 16.0,
        fontWeight: FontWeight.w400,
        color: AppColor.stringBlackColor,
      ),
      bodySmall: TextStyle(
        fontFamily: GoogleFonts.poppins().fontFamily,
        fontSize: 14.0,
        fontWeight: FontWeight.w600,
        color: AppColor.fontSecondary,
      ),
    ),
  );
}
