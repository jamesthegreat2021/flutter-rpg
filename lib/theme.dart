import 'package:flutter/material.dart';

//a static property is simply accessed through
//calling the classname + .static propert
//that will not instantiate the object..

class AppColors {
  static Color primaryColor = const Color.fromRGBO(162, 29, 19, 1);
  static Color primaryAccent = const Color.fromRGBO(120, 14, 14, 1);
  static Color secondaryColor = const Color.fromRGBO(45, 45, 45, 1);
  static Color secondaryAccent = const Color.fromRGBO(35, 35, 35, 1);
  static Color titleColor = const Color.fromRGBO(200, 200, 200, 1);
  static Color textColor = const Color.fromRGBO(150, 150, 150, 1);
  static Color successColor = const Color.fromRGBO(9, 149, 110, 1);
  static Color highlightColor = const Color.fromRGBO(212, 172, 13, 1);

}

ThemeData primaryTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: AppColors.primaryColor
    ),

    //scaffold defaults
    scaffoldBackgroundColor: AppColors.secondaryAccent,

    //appbar defaults expects an object
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.secondaryAccent,
      foregroundColor: AppColors.textColor,
      surfaceTintColor: Colors.transparent,

    ),
    textTheme: TextTheme(
      bodyMedium: TextStyle(
        color: AppColors.textColor,
        fontSize: 16,
        letterSpacing: 1,
      ),
      headlineMedium: TextStyle(
        color: AppColors.titleColor,
        fontSize: 16, 
        fontWeight: FontWeight.bold,
        letterSpacing: 1,
      ),
      titleMedium: TextStyle(
        color: AppColors.titleColor,
        fontSize: 18, 
        fontWeight: FontWeight.bold, 
        letterSpacing: 2,
      ),
    ),

    //card themes
    cardTheme: CardTheme(
      color: AppColors.secondaryColor.withOpacity(0.5),
      surfaceTintColor: Colors.transparent,
      shape: RoundedRectangleBorder(),
      shadowColor: Colors.transparent,
      margin: const EdgeInsets.only(bottom: 16),
    ),

    //input decoration theme
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      //thisis a background color
      fillColor: AppColors.secondaryColor.withOpacity(0.5),
      border: InputBorder.none,
      labelStyle: TextStyle(color: AppColors.textColor),
      prefixIconColor: AppColors.textColor,
    ),

    //dialog theme
    dialogTheme: DialogTheme(
    backgroundColor: AppColors.secondaryAccent,
    surfaceTintColor: Colors.transparent,
    ),

);