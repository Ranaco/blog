import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:log/ui/widgets/constants.dart';

class CustomTheme {
  static ThemeData darkTheme = ThemeData(
      scaffoldBackgroundColor: Colors.black,
      textTheme: GoogleFonts.mPlusRounded1cTextTheme().apply(
        bodyColor: Constants.light
      ),
      bottomSheetTheme:
          const BottomSheetThemeData(backgroundColor: Colors.transparent));
  static ThemeData lightTheme = ThemeData(
      scaffoldBackgroundColor: Colors.white,
      textTheme: GoogleFonts.mPlusRounded1cTextTheme().apply(
        bodyColor: Constants.darkGrey
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: Colors.transparent,
      ));
}
