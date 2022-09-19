import 'package:flutter/material.dart';
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
        color: Constants.light,
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        onTap: callBack,
        title: Text(name),
        leading: Padding(
          padding: const EdgeInsets.all(5.0),
          child: AppIcon(icon),
        ),
        trailing: const Icon(Icons.chevron_right),
      )
    );
  }
}