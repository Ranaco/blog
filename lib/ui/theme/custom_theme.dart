import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:log/ui/widgets/constants.dart';

class CustomTheme {
  static ThemeData darkTheme = ThemeData(
    primaryColor: Constants.nord0,
    backgroundColor: Constants.nord0,
    textTheme: GoogleFonts.mPlusRounded1cTextTheme().apply(
      bodyColor: Constants.ice0,
    ),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: GoogleFonts.mPlusRounded1c(),
    ),
    bottomSheetTheme:
    const BottomSheetThemeData(backgroundColor: Colors.transparent),
    scaffoldBackgroundColor: Constants.nord0,
  );

  static ThemeData lightTheme = ThemeData(
    primaryColor: Constants.ice2,
    backgroundColor: Constants.ice2,
    scaffoldBackgroundColor: Constants.ice2,
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: GoogleFonts.mPlusRounded1c(),
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: Colors.transparent,
    ),
    textTheme:
    GoogleFonts.mPlusRounded1cTextTheme().apply(bodyColor: Constants.nord0),
  );
}
