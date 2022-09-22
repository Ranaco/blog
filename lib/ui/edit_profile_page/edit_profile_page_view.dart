import 'package:flutter/material.dart';
import 'package:log/ui/edit_profile_page/edit_profile_page_viewmodel.dart';
import 'package:stacked/stacked.dart';

class EditProfilePageView extends StatelessWidget {
  const EditProfilePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<EditProfilePageViewModel>.reactive(
        viewModelBuilder: () => EditProfilePageViewModel(),
        builder: (context, model, child) {
          return Scaffold(
              appBar: AppBar(),
              body: const Center(
               child: Text("Edit profile page view"))
          );
        });
  }
}
