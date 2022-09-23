import 'package:flutter/material.dart';
import 'package:log/app/app.locator.dart';
import 'package:log/ui/scaffold.dart';
import 'package:log/ui/settings_page/settings_page_viewmodel.dart';
import 'package:log/ui/theme/theme_provider.dart';
import 'package:log/ui/widgets/app_icon/app_icon.dart';
import 'package:log/ui/widgets/app_icon/app_icons.dart';
import 'package:log/ui/widgets/constants.dart';
import 'package:log/ui/widgets/custom_bottom_sheet.dart';
import 'package:log/ui/widgets/profile_tile.dart';
import 'package:log/ui/widgets/settings_tile.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';

class SettingsPageView extends StatelessWidget {
  const SettingsPageView({ Key? key }) :super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return ViewModelBuilder<SettingsPageViewModel>.reactive(
        viewModelBuilder: () => SettingsPageViewModel(),
        builder: (context, model, child) {
          return Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15),
            child: ScrollConfiguration(
              behavior: RemoveGlow(),
              child: ListView(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  children: [
                    const ProfileTile(name: "Tris",
                        bio: "This is the only thing that I know about us",
                        avatarUrl: "https://picsum.photos/300/"),
                    const SizedBox(
                      height: 10,
                    ),
                    SettingsTile(
                        callBack: () {
                          model.takeToEditProfilePage();
                        },
                        icon: AppIcons.profile, name: "Profile"),
                    const SizedBox(
                      height: 10,
                    ),
                    SettingsTile(
                        callBack: () {
                          showModalBottomSheet(
                              context: context, builder: (context) {
                            return CustomBottomSheet(
                              height: 190,
                              children: [
                                ListTile(
                                  title: const Text("Light"),
                                  leading: AppIcon(AppIcons.sun, size: 30, color: ThemeProvider.useColorMode(Colors.yellow, Constants.nord0),),
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(10),
                                          topLeft: Radius.circular(10))
                                  ),
                                  tileColor: ThemeProvider.useColorMode(Constants.nord2, Constants.ice2),
                                  onTap: (){
                                    themeProvider.changeTheme(false);
                                    model.popPage();
                                  },
                                ),
                                Container(
                                    width: MediaQuery
                                        .of(context)
                                        .size
                                        .width,
                                    color: ThemeProvider.useColorMode(Constants.nord0, Constants.ice0),
                                    height: 2
                                ),
                                ListTile(
                                  title: const Text("Dark"),
                                  leading: AppIcon(AppIcons.moon, size: 20, color: ThemeProvider.useColorMode(Constants.ice2, Constants.nord0),),
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(10),
                                          bottomLeft: Radius.circular(10))
                                  ),
                                  tileColor: ThemeProvider.useColorMode(Constants.nord2, Constants.ice2),
                                  onTap: (){
                                    themeProvider.changeTheme(true);
                                    model.popPage();
                                  },
                                ),
                                SizedBox(
                                  height: 5,
                                  width: MediaQuery
                                      .of(context)
                                      .size
                                      .width,
                                ),
                                ListTile(
                                  onTap:  (){
                                    model.popPage();
                            },
                                  title: const Text("Cancel", style: TextStyle(
                                      color: Colors.red
                                  ),
                                    textAlign: TextAlign.center,
                                  ),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)
                                  ),
                                  tileColor: ThemeProvider.useColorMode(Constants.nord2, Constants.ice2),
                                )
                              ],
                            );
                          });
                        },
                        icon: ThemeProvider.mode(AppIcons.moon, AppIcons.sun),
                        name: "Theme")
                  ]
              ),
            ),
          );
        });
  }
}