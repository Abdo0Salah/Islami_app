import 'package:flutter/material.dart';

class MyTheme {
  static Color primary = Color(0xFFB7935F);
  static ThemeData lightTheme = ThemeData(
      appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.transparent,
          centerTitle: true,
          elevation: 0.0),
      textTheme: TextTheme(
          bodyLarge: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w700,
        fontSize: 30,
      ),
          bodyMedium: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 25,
          )
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: primary,
          type: BottomNavigationBarType.shifting,
          unselectedItemColor: Colors.white,
          selectedLabelStyle: TextStyle(color: Colors.black),
          selectedIconTheme: IconThemeData(color: Colors.black)));
}
