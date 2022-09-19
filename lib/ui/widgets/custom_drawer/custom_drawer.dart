import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:log/ui/widgets/custom_drawer/custom_drawer_viewmodel.dart';
import 'package:stacked/stacked.dart';

class CustomDrawer extends StatelessWidget{
  const CustomDrawer({Key? key}):super(key: key);

  @override
  Widget build(BuildContext context){
    return ViewModelBuilder<CustomDrawerViewModel>.reactive(
        viewModelBuilder: () => CustomDrawerViewModel(), builder: (context, model, child){
      return Container(
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.3),
        ),
        width: MediaQuery.of(context).size.width * (70/100),
        height: MediaQuery.of(context).size.height,
        child: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 5,
              sigmaY: 5,
            ),
            child: Container(),
          ),
        ),
      );
    });
  }
}
