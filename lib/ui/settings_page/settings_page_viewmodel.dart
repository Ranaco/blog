import 'package:log/app/app.locator.dart';
import 'package:log/app/app.router.dart';
import 'package:stacked/stacked.dart';
class SettingsPageViewModel extends BaseViewModel{

  final _appRouter = locator<AppRouter>();
  bool _isDark = true;

  bool get isDark => _isDark;

  popPage() async {
    await _appRouter.pop();
  }

  takeToEditProfilePage() async {
    await _appRouter.push(const EditProfilePageRoute());
  }

  toggleIsDark(bool val) {
    _isDark = val;
    notifyListeners();
  }

}