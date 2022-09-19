import 'package:stacked/stacked.dart';

class HomePageViewModel extends BaseViewModel{
  int currentTab = 0;

  changeTab(int tabToChange){
    currentTab = tabToChange;
    notifyListeners();
  }
}