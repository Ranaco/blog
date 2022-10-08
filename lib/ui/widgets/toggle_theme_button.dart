import 'package:flutter/material.dart';
import 'package:log/ui/theme/theme_provider.dart';
import 'package:log/ui/widgets/app_icon/app_icon.dart';
import 'package:log/ui/widgets/app_icon/app_icons.dart';
import 'package:log/ui/widgets/constants.dart';
import 'package:provider/provider.dart';

class ToggleThemeButton extends StatefulWidget {
  const ToggleThemeButton(
      {Key? key, required this.isDark, required this.voidCallback})
      : super(key: key);
  final bool isDark;
  final VoidCallback voidCallback;

  @override
  State<ToggleThemeButton> createState() => _ToggleThemeButtonState();
}

class _ToggleThemeButtonState extends State<ToggleThemeButton>  with SingleTickerProviderStateMixin{

  late final AnimationController _animationController;
  @override
  void initState() {
    _animationController = AnimationController(vsync: this,  duration: const Duration(milliseconds: 500));
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.voidCallback,
      child: Container(
          width: 76,
          height: 35,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 1),
              color: widget.isDark ? Constants.nord0 : Constants.ice0,
              borderRadius: const BorderRadius.all(Radius.circular(30))),
          child: Padding(
            padding: const EdgeInsets.all(2),
            child: Stack(
                children: [
             SizedBox(
               height: 35,
               child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    AppIcon(AppIcons.moon, color: Constants.ice2,),
                    AppIcon(AppIcons.sun, size: 30,)
                  ],
                ),
             ),
                  SizedBox(
                    height: 35,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                         AnimatedContainer(
                             duration: const Duration(milliseconds: 200),
                             width: widget.isDark ? 40 : 0,
                             child: const SizedBox()),
                         AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          height: 35,
                           width: 30,
                           decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: widget.isDark ? Constants.ice2 : Constants.nord0
                           ),
                         )
                      ]
                    ),
                  )
            ]),
          )),
    );
  }
}
