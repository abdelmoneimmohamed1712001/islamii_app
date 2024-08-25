import 'package:flutter/material.dart';

class MyThemeData {
  static const Color goldColor = Color(0xffB7935F);
  static const Color darkColor = Color(0xff141A2E);
  static const Color yellowColor = Color(0xffFACC1D);
  static ThemeData lightTheme = ThemeData(
      fontFamily: "elmessiri",
      primaryColor: goldColor,
      colorScheme: ColorScheme.fromSeed(
          seedColor: Color(0xFFB7935F),
          primary: goldColor,
          secondary: goldColor),
      appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        titleTextStyle: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w700,
            color: Colors.black,
            fontFamily: 'ElMessiri'),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
      ),
      scaffoldBackgroundColor: Colors.transparent,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.white,
          selectedIconTheme: IconThemeData(
            size: 36,
          ),
          unselectedIconTheme: IconThemeData(
            size: 24,
          ),
          showSelectedLabels: true,
          showUnselectedLabels: true),
      cardTheme: CardTheme(
          color: Colors.white,
          elevation: 8,
          margin: EdgeInsets.symmetric(vertical: 18, horizontal: 15),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(18))),
      bottomSheetTheme: BottomSheetThemeData(
          backgroundColor: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(18))),
      dividerColor: goldColor,
      textTheme: TextTheme(
        labelMedium: TextStyle(
            fontSize: 22, fontWeight: FontWeight.w600, color: Colors.black),
        titleMedium: TextStyle(
            fontSize: 25, fontWeight: FontWeight.w400, color: Colors.black),
        bodySmall: TextStyle(
            fontSize: 20, fontWeight: FontWeight.w400, color: Colors.black),
        bodyMedium: TextStyle(
            fontSize: 25, fontWeight: FontWeight.w400, color: Colors.black),
        bodyLarge: TextStyle(
            fontSize: 25, fontWeight: FontWeight.w400, color: Colors.white),
        titleSmall: TextStyle(
            fontSize: 25, fontWeight: FontWeight.w400, color: goldColor),
        labelSmall: TextStyle(
            color: Colors.black, fontSize: 18, fontWeight: FontWeight.w700),
      ));
  static ThemeData darkTheme = ThemeData(
    fontFamily: "elmessiri",
    primaryColor: darkColor,
    colorScheme: ColorScheme.fromSeed(
        seedColor: Color(0xFFB7935F),
        primary: yellowColor,
        secondary: darkColor),
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: TextStyle(
          fontSize: 30, fontWeight: FontWeight.w700, color: Colors.white),
      backgroundColor: Colors.transparent,
      centerTitle: true,
      elevation: 0,
    ),
    scaffoldBackgroundColor: Colors.transparent,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: yellowColor,
        unselectedItemColor: Colors.white,
        selectedIconTheme: IconThemeData(
          size: 36,
        ),
        unselectedIconTheme: IconThemeData(
          size: 24,
        ),
        showSelectedLabels: true,
        showUnselectedLabels: true),
    cardTheme: CardTheme(
        color: darkColor,
        elevation: 8,
        margin: EdgeInsets.symmetric(vertical: 18, horizontal: 15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18))),
    bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: darkColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18))),
    dividerColor: yellowColor,
    textTheme: TextTheme(
      labelMedium: TextStyle(
          fontSize: 22, fontWeight: FontWeight.w600, color: Colors.white),
      titleMedium: TextStyle(
          fontSize: 25, fontWeight: FontWeight.w400, color: Colors.white),
      bodySmall: TextStyle(
          fontSize: 20, fontWeight: FontWeight.w400, color: yellowColor),
      bodyMedium: TextStyle(
          fontSize: 25, fontWeight: FontWeight.w400, color: yellowColor),
      bodyLarge: TextStyle(
          fontSize: 25, fontWeight: FontWeight.w400, color: Colors.black),
      labelSmall: TextStyle(
          color: Colors.white, fontSize: 18, fontWeight: FontWeight.w700),
      titleSmall: TextStyle(
          fontSize: 25, fontWeight: FontWeight.w400, color: yellowColor),
    ),
  );
}
