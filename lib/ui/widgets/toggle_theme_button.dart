import 'package:flutter/material.dart';
import 'package:log/ui/widgets/constants.dart';

class ToggleThemeButton extends StatelessWidget{
  const ToggleThemeButton({Key? key, required this.isDark, required this.voidCallback}):super(key: key);
  final bool isDark;
  final VoidCallback voidCallback;

  @override
  Widget build(BuildContext context){
    return GestureDetector(
      onTap: voidCallback,
      child: Container(
        width: 100,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(30))
        ),
      ),
    );
  }
}