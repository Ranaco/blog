import 'package:flutter/material.dart';

class CustomBottomSheet extends StatelessWidget{

  const CustomBottomSheet({ Key? key , this.children}):super(key: key);

  final List<Widget>? children;

  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: SizedBox(
        child: Column(
          children: children ?? [],
        ),
      ),
    );
  }
}