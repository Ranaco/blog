import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:log/ui/widgets/app_icon/app_icon.dart';
import 'package:log/ui/widgets/app_icon/app_icons.dart';
import 'package:log/ui/widgets/custom_appbar/custom_appbar_model.dart';
import 'package:stacked/stacked.dart';

class CustomAppbar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppbar({Key? key, required this.height, required this.currentIndex}) : super(key: key);
  final double height;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CustomAppbarModel>.reactive(
        viewModelBuilder: () =>  CustomAppbarModel(),
        builder: (context, model, child) {
          return Padding(
        padding: const EdgeInsets.only(top: 10),
        child: SizedBox(
          height: height,
          width: double.infinity,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            child: Row(children: [
              currentIndex != 3 ? Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: GestureDetector(
                      onTap: () {
                        Scaffold.of(context).isDrawerOpen
                            ? Scaffold.of(context).closeDrawer()
                            : Scaffold.of(context).openDrawer();
                      },
                      child: const AppIcon(AppIcons.menu))) : const SizedBox(),
            ]),
          ),
        ),
      );
    });
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
