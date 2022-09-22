import 'package:flutter/material.dart';

class CustomBottomSheet extends StatelessWidget{

  const CustomBottomSheet({ Key? key , this.children, this.height = 200}):super(key: key);

  final List<Widget>? children;
  final double height;

  @override
  Widget build(BuildContext context){
    return SizedBox(
      height: height,
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          children: children ?? [],
        ),
      ),
    );
  }
}