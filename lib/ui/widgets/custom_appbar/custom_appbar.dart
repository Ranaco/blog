import 'package:flutter/material.dart';
import 'package:log/ui/theme/theme_provider.dart';
import 'package:log/ui/widgets/app_icon/app_icon.dart';
import 'package:log/ui/widgets/app_icon/app_icons.dart';
import 'package:log/ui/widgets/constants.dart';

class CustomAppbar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppbar({Key? key, required this.height, required this.currentIndex}) : super(key: key);
  final double height;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: SizedBox(
        height: height,
        width: double.infinity,
        child: SizedBox(
          child: Row(children: [
            currentIndex != 3 ? Padding(
                padding: const EdgeInsets.only(left: 10),
                child: GestureDetector(
                    onTap: () {
                      Scaffold.of(context).isDrawerOpen
                          ? Scaffold.of(context).closeDrawer()
                          : Scaffold.of(context).openDrawer();
                    },
                    child: AppIcon(AppIcons.menu, color: ThemeProvider.useColorMode(Constants.ice1, Constants.nord0),))) : const SizedBox(),
          ]),
        ),
      ),
    );
  }
  @override
  Size get preferredSize => Size.fromHeight(height);
}
