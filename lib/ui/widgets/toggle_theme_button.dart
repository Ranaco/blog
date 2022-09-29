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

  late final _animationController;
  @override
  void initState() {
    _animationController = AnimationController(vsync: this,  duration: const Duration(milliseconds: 500));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.voidCallback,
      child: Container(
          width: 75,
          height: 30,
          decoration: BoxDecoration(
              color: widget.isDark ? Constants.nord0 : Constants.ice0,
              borderRadius: const BorderRadius.all(Radius.circular(30))),
          child: Stack(
              children: [
           SizedBox(
             height: 30,
             child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  AppIcon(AppIcons.moon),
                  AppIcon(AppIcons.sun, size: 30,)
                ],
              ),
           ),
                SizedBox(
                  height: 30,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                       widget.isDark ? const Expanded(child: SizedBox()) : const SizedBox(),
                       AnimatedContainer(
                        duration: const Duration(milliseconds: 400),
                        height: 30,
                         width: 30,
                         decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: widget.isDark ? Constants.ice2 : Constants.nord0
                         ),
                       )
                    ]
                  ),
                )
          ])),
    );
  }
}
