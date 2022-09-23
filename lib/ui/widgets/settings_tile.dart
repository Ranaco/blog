import 'package:flutter/material.dart';
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
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: ThemeProvider.useColorMode(Constants.nord2, Constants.ice0),
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        onTap: (){
          callBack!();
        },
        title: Text(name),
        leading: Padding(
          padding: const EdgeInsets.all(5.0),
          child: AppIcon(icon, color: ThemeProvider.useColorMode(Constants.ice2, Constants.nord0),),
        ),
        trailing: Icon(Icons.chevron_right, color: ThemeProvider.useColorMode(Colors.grey, Constants.nord0 ),),
      )
    );
  }
}