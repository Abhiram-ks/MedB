import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medb/core/themes/colors.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    primaryColor: AppPalette.blueColor,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppPalette.whiteColor,
    fontFamily: GoogleFonts.roboto().fontFamily,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppPalette.blueColor,
       iconTheme: IconThemeData(color: Colors.black),
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(color: AppPalette.blackColor),
      bodyMedium: TextStyle(color: AppPalette.blackColor),
      bodySmall: TextStyle(color: AppPalette.blackColor),
    )
  );
}