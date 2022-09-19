import 'package:flutter/material.dart';
import 'package:log/ui/theme/theme_pereferences.dart';

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

  setDark(bool val) {
    themePreferences = ThemePreferences();
    _isDark = val;
    themePreferences.setTheme(val);
    notifyListeners();
  }
}