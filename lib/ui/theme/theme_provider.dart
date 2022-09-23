import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/constants.dart';

class ThemeProvider extends ChangeNotifier {
  static late bool _isDark = false;

  bool get isDark => _isDark;

  toggleTheme() {
    _isDark = !_isDark;
    notifyListeners();
  }

  getCurrentTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? currentTheme = prefs.getBool("_isDark");
    changeTheme(currentTheme ?? false);
  }

  ThemeProvider() {
    getCurrentTheme();
  }

  ///Returns the color according to the current theme
  static Color useColorMode(Color dark, Color light) {
    if (_isDark) {
      return dark;
    } else {
      return light;
    }
  }

  changeTheme(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _isDark = value;
    prefs.setBool("_isDark", value);
    notifyListeners();
  }

  ///Returns "anything" according to the theme
  static dynamic mode(dynamic dark, dynamic light) {
    if (_isDark) {
      return dark;
    } else {
      return light;
    }
  }

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
    primaryColor: Constants.ice0,
    backgroundColor: Constants.ice0,
    scaffoldBackgroundColor: Constants.ice0,
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: GoogleFonts.mPlusRounded1c(),
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: Colors.transparent,
    ),
    textTheme:
    GoogleFonts.mPlusRounded1cTextTheme().apply(bodyColor: Constants.nord0),
  );

  ThemeData getTheme() {
    switch (_isDark) {
      case true:
        return darkTheme;
        break;
      case false:
        return lightTheme;
        break;
      default:
        return darkTheme;
        break;
    }
  }
}