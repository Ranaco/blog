import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:log/ui/theme/theme_pereferences.dart';

@singleton
class ThemeProvider extends ChangeNotifier{
  late bool _isDark;
  bool get isDark => _isDark;
  late ThemePreferences themePreferences;

  ThemeProvider(){
    themePreferences = ThemePreferences();
    _isDark = true;
    getTheme();
  }

  getTheme() async {
    themePreferences = ThemePreferences();
    _isDark = await themePreferences.loadTheme();
    notifyListeners();
  }

  mode(dynamic dark, dynamic light){
    if(_isDark){
      return dark;
    } else {
      return light;
    }
  }

  userColorMode(Color dark, Color light){
    if(_isDark){
      return dark;
    } else {
      return light;
    }
 }

  setDark(bool val) {
    themePreferences = ThemePreferences();
    _isDark = val;
    themePreferences.setTheme(val);
    notifyListeners();
  }
}