import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:log/ui/notification_page/notification_page_viewmodel.dart';

class NotificationPageView extends StatelessWidget{

  const NotificationPageView({Key?  key}):super(key: key);

  @override
  Widget build(BuildContext context){
    return ViewModelBuilder<NotificationPageViewModel>.reactive(
        viewModelBuilder: () => NotificationPageViewModel(),
        builder: (context, model, child){
          return const Center(
            child: Text("Notification page")
          );
        });
  }
}
