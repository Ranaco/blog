import 'package:log/app/app.locator.dart';
import 'package:log/app/app.router.dart';
import 'package:stacked/stacked.dart';

class BlogPageViewModel extends BaseViewModel {
  final _appRouter = locator<AppRouter>();

  popPage(){
    _appRouter.pop();
  }
}
