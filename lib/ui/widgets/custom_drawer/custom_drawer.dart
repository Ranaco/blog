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
        width: MediaQuery.of(context).size.width * (80/100),
        height: MediaQuery.of(context).size.height,
        child: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 5,
              sigmaY: 5,
            ),
            child: Column(
              children: [
                 DrawerHeader(
                   curve: Curves.bounceIn,
                    child: Container(
                      height: 150,
                      width: 150,
                      decoration:BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black.withOpacity(0.1),
                      ),
                      child: ClipRect(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaY: 5, sigmaX: 5),
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Container(
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                  image: NetworkImage("https://picsum.photos/300/")
                                )
                              ),
                            ),
                          )
                        ),
                      ),
                    ),
                ),
                ListTile(

                )
                ]
            ),
          ),
        ),
      );
    });
  }
}
