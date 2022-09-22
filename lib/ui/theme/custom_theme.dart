import 'package:flutter/material.dart';

class CustomTheme{
  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.black,
    bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: Colors.transparent
  )
  );
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
      bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: Colors.transparent,
      )
  );
}