import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:log/app/app.locator.dart';
import 'package:log/app/app.router.dart';
import 'package:log/ui/theme/theme_provider.dart';
import 'package:log/ui/widgets/app_icon/app_icon.dart';
import 'package:log/ui/widgets/app_icon/app_icons.dart';
import 'package:log/ui/widgets/constants.dart';
import 'package:log/ui/widgets/custom_appbar/custom_appbar.dart';
import 'package:log/ui/widgets/custom_drawer/custom_drawer.dart';
import 'package:stacked/stacked.dart';

class HomeScaffoldModel extends BaseViewModel{
  int currentIndex = 0;

  updateCurrentIndex(int val){
    currentIndex = val;
    notifyListeners();
  }
}

class HomeScaffold extends StatefulWidget{
  const HomeScaffold({Key? key}):super(key: key);

  @override
  State<HomeScaffold> createState() => _HomeScaffold();
}

class _HomeScaffold extends State<HomeScaffold>{

  @override
  Widget build(BuildContext context){

    return ViewModelBuilder<HomeScaffoldModel>.reactive(viewModelBuilder: () => HomeScaffoldModel(), builder: (context, model, child){
      final themeProvider = locator<ThemeProvider>();
      return AutoTabsRouter.tabBar(
        builder: (context, child, pageController) {
          takeToPage(int val) {
            model.updateCurrentIndex(val);
            pageController.animateTo(
                model.currentIndex,
                duration: const Duration(milliseconds: 300),
                curve: Curves.ease);
          }
          return Scaffold(
            drawerEnableOpenDragGesture: true,
            drawerScrimColor: Colors.transparent,
            extendBody: true,
            backgroundColor: themeProvider.userColorMode(Constants.darkGrey, Constants.scaffoldGrey),
            drawer: const  CustomDrawer(),
            appBar: CustomAppbar(height: 70, currentIndex: model.currentIndex,),
            body: Padding(
                padding: const EdgeInsets.only(bottom: 60),
                child: child
            ),
            bottomNavigationBar: BottomAppBar(
              elevation: 0,
              notchMargin: 5,
              shape: const CircularNotchedRectangle(),
              color: themeProvider.userColorMode(Constants.grey, Constants.bottomBarGrey),
              child: SizedBox(
                height: 70,
                child: SizedBox(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                          onPressed: (){
                            takeToPage(0);
                          }, icon: AppIcon(AppIcons.home, color: model.currentIndex == 0 ? Constants.darkGrey : Colors.grey, )),
                      IconButton(
                          onPressed: (){
                            takeToPage(1);
                          }, icon: AppIcon(AppIcons.favorite, color: model.currentIndex == 1 ? Constants.darkGrey : Colors.grey,)),
                      const SizedBox(
                        width: 10,
                      ),
                      IconButton(
                          onPressed: (){
                            takeToPage(2);
                          }, icon: AppIcon(AppIcons.bell, color: model.currentIndex == 2 ? Constants.darkGrey : Colors.grey,)),
                      IconButton(
                          onPressed: (){
                            takeToPage(3);
                          }, icon: AppIcon(AppIcons.options, color: model.currentIndex == 3 ? Constants.darkGrey : Colors.grey,))
                    ],
                  ),
                ),
              ),
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
            floatingActionButton: FloatingActionButton(
              onPressed: (){},
              backgroundColor: themeProvider.userColorMode(Constants.grey, Constants.lightBlue),
              child: Icon(Icons.add, color: themeProvider.userColorMode(Constants.lightGrey, Constants.grey),),
            ),
          );
        },
        routes: const [HomePageRoute(), FavoritePageRoute(), NotificationPageRoute(), SettingsPageRoute()],
        homeIndex: model.currentIndex,
      );
    });
  }
}

class RemoveGlow extends ScrollBehavior {

  @override
  Widget buildOverscrollIndicator(BuildContext context, Widget child, ScrollableDetails details){
  return child;
}

}