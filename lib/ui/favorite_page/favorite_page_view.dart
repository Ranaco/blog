import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:log/ui/favorite_page/favorite_page_viewmodel.dart';

class FavoritePageView extends StatelessWidget{
  const FavoritePageView({Key? key, required this.currentIndex}):super(key: key);
  final int currentIndex;

  @override
  Widget build(BuildContext context){
    return ViewModelBuilder<FavoritePageViewModel>.reactive(
      viewModelBuilder: () => FavoritePageViewModel(),
      builder: (context, model, child){
        return Center(
          child: Text("Favorite page view" + currentIndex.toString())
          );
        }
      );
  }
}
