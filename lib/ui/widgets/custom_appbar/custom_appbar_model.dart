import 'package:stacked/stacked.dart';

class CustomAppbarModel extends BaseViewModel{

  bool isDark = false;

  toggleIsDark(){
    isDark = !isDark;
    notifyListeners();
  }
}