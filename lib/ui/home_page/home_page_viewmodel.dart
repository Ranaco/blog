import 'package:log/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:log/app/app.locator.dart';

class HomePageViewModel extends BaseViewModel{
  int currentTab = 0;
  final appRouter = locator<AppRouter>();

  changeTab(int tabToChange){
    currentTab = tabToChange;
    notifyListeners();
  }

  takeToProfilePage(String tag) async {
    appRouter.push(BlogPageRoute(tag: tag));
  }
}