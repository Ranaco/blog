import 'package:flutter/material.dart';
import 'package:log/ui/settings_page/settings_page_viewmodel.dart';
import 'package:log/ui/widgets/app_icon/app_icon.dart';
import 'package:log/ui/widgets/app_icon/app_icons.dart';
import 'package:log/ui/widgets/constants.dart';
import 'package:log/ui/widgets/custom_bottom_sheet.dart';
import 'package:log/ui/widgets/profile_tile.dart';
import 'package:log/ui/widgets/settings_tile.dart';
import 'package:stacked/stacked.dart';

class SettingsPageView extends StatelessWidget{
  const SettingsPageView({ Key? key }):super(key: key);

  @override
  Widget build(BuildContext context){
    return ViewModelBuilder<SettingsPageViewModel>.reactive(
        viewModelBuilder: () => SettingsPageViewModel(),
        builder: (context, model, child){
          return  Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15),
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 10),
              children:[
                const ProfileTile(name: "Tris", bio: "This is the only thing that I know about us", avatarUrl: "https://picsum.photos/300/"),
                const SizedBox(
                  height: 10,
                ),
                SettingsTile(callBack: (){
                  print("hello there");
                }, icon: AppIcons.profile, name: "Profile"),
                const SizedBox(
                  height: 10,
                ),
                SettingsTile(
                  callBack: (){
                 showModalBottomSheet(context: context, builder: (context) {
                   return CustomBottomSheet(
                     height: 190,
                     children: [
                      const ListTile(
                        title: Text("Light"),
                        leading: AppIcon(AppIcons.sun, size: 30,),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(topRight: Radius.circular(10), topLeft: Radius.circular(10))
                        ),
                        tileColor: Constants.lightGrey,
                      ),
                       Container(
                        width: MediaQuery.of(context).size.width,
                         color: Constants.scaffoldGrey,
                         height: 2,
                       ),
                       const ListTile(
                         title:  Text("Dark"),
                         leading:  AppIcon(AppIcons.moon, size: 20,),
                         shape: RoundedRectangleBorder(
                             borderRadius: BorderRadius.only(bottomRight: Radius.circular(10), bottomLeft: Radius.circular(10))
                         ),
                         tileColor: Constants.lightGrey,
                       ),
                       SizedBox(
                         height: 5,
                         width: MediaQuery.of(context).size.width,
                       ),
                       ListTile(
                         title: const Text("Cancel", style: TextStyle(
                           color: Colors.red
                         ),
                           textAlign: TextAlign.center,
                         ),
                         shape: RoundedRectangleBorder(
                             borderRadius: BorderRadius.circular(10)
                         ),
                         tileColor: Constants.lightGrey,
                       )
                     ],
                   );
                 });
                }, icon: (model.isDark ? AppIcons.moon : AppIcons.sun), name: "Theme")
              ]
            ),
          );
        });
  }
}