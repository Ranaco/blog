import 'package:log/app/app.locator.dart';
import 'package:log/app/app.router.dart';
import 'package:stacked/stacked.dart';

class BlogPageViewModel extends BaseViewModel {
  final _appRouter = locator<AppRouter>();
  late bool pageIsDark;

  onModelReady(bool value){
    pageIsDark = value;
    notifyListeners();
  }

  togglePageIsDark(){
    pageIsDark = !pageIsDark;
    notifyListeners();
  }

  popPage(){
    _appRouter.pop();
  }
}
