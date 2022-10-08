import 'package:flutter/material.dart';
import 'package:log/ui/theme/theme_provider.dart';
import 'package:log/ui/widgets/constants.dart';
import 'package:log/ui/widgets/toggle_theme_button.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';
import './blog_page_viewmodel.dart';

class BlogPageView extends StatelessWidget {
  const BlogPageView({Key? key, required this.tag}) : super(key: key);
  final String tag;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return ViewModelBuilder<BlogPageViewModel>.reactive(
        viewModelBuilder: () => BlogPageViewModel(),
        onModelReady: (model) {
         model.onModelReady(themeProvider.isDark);
        },
        builder: (context, model, child) {
          return Hero(
            tag: tag,
            child: Scaffold(
              backgroundColor: model.pageIsDark ? Constants.nord0 : Constants.ice0,
                body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(5, 10, 5, 5),
                  child: Center(
                      child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Stack(
                            children: [
                              SizedBox(
                                width: double.infinity,
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image.asset(
                                      tag,
                                      fit: BoxFit.fitWidth,
                                    )),
                              ),
                              Positioned(
                                top: 5,
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width - 20,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      GestureDetector(
                                          onTap: model.popPage,
                                          child: const Icon(
                                            Icons.chevron_left,
                                            color: Constants.ice2,
                                            size: 40,
                                          )),
                                      ToggleThemeButton(isDark: model.pageIsDark, voidCallback: model.togglePageIsDark)
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ))),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                     Container(
                       color: Colors.blue,
                       width: 30,
                      child: RotatedBox(
                        quarterTurns: 3,
                        child: ListView(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                          ],
                         ),
                      )
                     ),
                     Expanded(
                       child: Container(),
                     )
                    ]
                  ),
                ),
              ],
            )),
          );
        });
  }
}
