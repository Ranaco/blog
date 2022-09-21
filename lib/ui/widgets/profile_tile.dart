import 'package:flutter/material.dart';
import 'package:log/ui/widgets/constants.dart';

class ProfileTile extends StatelessWidget {
  const ProfileTile(
      {Key? key,
      required this.name,
      required this.bio,
      required this.avatarUrl})
      : super(key: key);

  final String name;
  final String bio;
  final String avatarUrl;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Card(
        color: Constants.light,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
           crossAxisAlignment: CrossAxisAlignment.center,
           children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  height: 70,
                  child: ClipOval(
                      child: Image.network(avatarUrl)),
                ),
                Text(name, style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400
                ),),
              ]
            ),
             Padding(
               padding: const EdgeInsets.symmetric(horizontal: 20.0),
               child: Container(
                 height: 100,
                 width: 1,
                 color: Colors.grey,
               ),
             ),
             Expanded(child: Text(bio)),
           ],
          ),
        ),
      ),
    );
  }
}
