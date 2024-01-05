import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lon_stores/src/config/theme/app_color.dart';

abstract class AppTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
        scaffoldBackgroundColor: AppColors.backgroundColor,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primaryColor,
          background: AppColors.backgroundColor,
        ),
        textTheme: GoogleFonts.dmSansTextTheme(
          Theme.of(context).textTheme,
        ),
        iconButtonTheme: IconButtonThemeData(
          style: ButtonStyle(
            overlayColor: MaterialStateProperty.all(Colors.transparent),
            shadowColor: MaterialStateProperty.all(Colors.transparent),
          ),
        ),
        appBarTheme: AppBarTheme(
          centerTitle: true,
          backgroundColor: AppColors.white,
          elevation: 0,
          scrolledUnderElevation: 0,
          iconTheme: IconThemeData(
            color: AppColors.textColor,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(AppColors.primaryColor),
            overlayColor: MaterialStateProperty.all(Colors.transparent),
            shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            overlayColor: MaterialStateProperty.all(Colors.transparent),
          ),
        ),
        useMaterial3: true,
      );
}
