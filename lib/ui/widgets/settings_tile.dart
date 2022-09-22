import 'package:flutter/material.dart';
import 'package:log/app/app.locator.dart';
import 'package:log/ui/theme/theme_provider.dart';
import 'package:log/ui/widgets/app_icon/app_icon.dart';
import 'package:log/ui/widgets/app_icon/app_icons.dart';
import 'package:log/ui/widgets/constants.dart';

class SettingsTile extends StatelessWidget{
  const SettingsTile({
    Key? key,
    required this.callBack,
    required this.icon,
    required this.name })
      :super(key: key);

  final String name;
  final AppIcons icon;
  final VoidCallback? callBack;

  @override
  Widget build(BuildContext context){
    final themeProvider = locator<ThemeProvider>();
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: themeProvider.userColorMode(Constants.grey, Constants.light),
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        onTap: callBack,
        title: Text(name),
        leading: Padding(
          padding: const EdgeInsets.all(5.0),
          child: AppIcon(icon, color: themeProvider.userColorMode(Constants.bottomBarGrey, Constants.darkGrey),),
        ),
        trailing: Icon(Icons.chevron_right, color: themeProvider.userColorMode(Colors.grey, Constants.darkGrey ),),
      )
    );
  }
}