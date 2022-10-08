import 'package:log/app/app.locator.dart';
import 'package:log/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';

class BlogPageViewModel extends BaseViewModel {
  final _appRouter = locator<AppRouter>();
  late bool pageIsDark;
  late final PageController pageController;
  int currentPage = 0;
  List<String> topics = [
   "Introduction",
   "How to: basics",
   "What we think?",
   "Prologue",
   "End"
  ];


  onModelReady(bool value){
    pageIsDark = value;
    pageController = PageController(initialPage: currentPage);
    notifyListeners();
  }

  jumpToPage(int page){
    print("helloo there");
    currentPage = page;
    pageController.animateToPage(currentPage, curve: Curves.easeInOut, duration: const Duration(milliseconds: 200));
    // pageController.jumpToPage(currentPage);
    notifyListeners();
  }

  disposeController(){
    pageController.dispose();
  }

  togglePageIsDark(){
    pageIsDark = !pageIsDark;
    notifyListeners();
  }

  popPage(){
    _appRouter.pop();
  }
}
