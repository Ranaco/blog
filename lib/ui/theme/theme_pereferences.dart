import 'package:shared_preferences/shared_preferences.dart';

class ThemePreferences {

  Future<bool> loadTheme() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    bool isDark = sharedPreferences.getBool('isDark') ?? false;
    return isDark;
  }

  setTheme(bool themeValue) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool('isDark', themeValue);
  }
}