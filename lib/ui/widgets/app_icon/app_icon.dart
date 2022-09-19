library heroicon;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import './app_icons.dart';

class AppIcon extends StatelessWidget{
  const AppIcon(this.icon,
      {Key? key,
         this.color,
         this.size,
         this.width}
      ):super(key: key);

  final AppIcons icon;
  final Color? color;
  final double? size;
  final double? width;

  @override
  Widget build(BuildContext context){
    return SvgPicture.asset(
      'assets/icons/$icon.svg',
      color: color ?? IconTheme.of(context).color,
      height: size ?? 20,
      width: size ?? width ?? 20,
    );
  }
}