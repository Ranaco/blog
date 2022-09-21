import 'package:stacked/stacked.dart';
class SettingsPageViewModel extends BaseViewModel{

  bool _isDark = true;

  bool get isDark => _isDark;

  toggleIsDark(bool val) {
    _isDark = val;
    notifyListeners();
  }

}