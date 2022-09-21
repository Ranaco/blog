import 'package:flutter/material.dart';
import 'package:log/ui/settings_page/settings_page_viewmodel.dart';
import 'package:log/ui/widgets/app_icon/app_icons.dart';
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
              padding: EdgeInsets.symmetric(vertical: 10),
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
                   return const CustomBottomSheet();
                 });
                }, icon: (model.isDark ? AppIcons.moon : AppIcons.sun), name: "Theme")
              ]
            ),
          );
        });
  }
}