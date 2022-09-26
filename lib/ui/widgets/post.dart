import 'dart:math';

import 'package:flutter/material.dart';

class Post extends StatelessWidget {
  const Post({Key? key, required this.width, this.height, required this.postString, required this.callback}) : super(key: key);
  final double width;
  final String postString;
  final double? height;
  final VoidCallback callback;
  @override
  Widget build(BuildContext context) {

    Random random = Random();

    int imageHeight =  1 + random.nextInt(5);
    Image post =
        Image.asset(postString, fit: BoxFit.fill);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: callback,
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: post,
              ),
              const SizedBox(height: 10,),
              const Text(
                  "Hello there everyone this is the best thing I have ever done.",
                  style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(
                height: 10,
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      '24 Jun, 2021',
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                    Text(
                      '◉',
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text('12 min read', style: TextStyle(color: Colors.grey, fontSize: 12))
                  ])
            ],
          ),
        ),
      ),
    );
  }
}
