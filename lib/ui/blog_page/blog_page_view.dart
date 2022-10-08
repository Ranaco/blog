import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:log/ui/scaffold.dart';
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

    Widget sideBarText(String text,{required bool isDark, required VoidCallback callback, required bool isActive}) {
      return GestureDetector(
        onTap: callback,
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20, top: 15),
          child: Text(text.toUpperCase(), style: TextStyle(
            color: isActive ? isDark ? Constants.ice0 : Constants.nord0 : Colors.grey,
            fontSize: 17,
            fontWeight: FontWeight.bold
          )),
        ),
      );
    }

    final themeProvider = Provider.of<ThemeProvider>(context);
    return ViewModelBuilder<BlogPageViewModel>.reactive(
        viewModelBuilder: () => BlogPageViewModel(),
        onDispose: (model) => model.disposeController,
        onModelReady: (model) {
         model.onModelReady(themeProvider.isDark);
        },
        builder: (context, model, child) {
          return Hero(
            tag: tag,
            child: Scaffold(
              backgroundColor: model.pageIsDark ? Constants.nord0 : Constants.ice0,
                body: ScrollConfiguration(
                  behavior: RemoveGlow(),
                  child: Stack(
                    children: [
                      ListView(
                        shrinkWrap: true,
                        children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(5, 0, 5, 5),
                        child: Center(
                            child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: SizedBox(
                                  width: double.infinity,
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Image.asset(
                                        tag,
                                        fit: BoxFit.fitWidth,
                                      )),
                                ))),
                      ), Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                         SizedBox(
                           width: 35,
                          child: RotatedBox(
                            quarterTurns: 3,
                            child: ScrollConfiguration(
                              behavior: RemoveGlow(),
                              child: ListView(
                                shrinkWrap: true,
                                reverse: true,
                                padding: const EdgeInsets.only(left: 10, right: 80),
                                scrollDirection: Axis.horizontal,
                                children: List.generate(
                                    model.topics.length, (index) =>
                                    sideBarText(
                                        model.topics[index],
                                        isActive: index == model.currentPage,
                                        isDark: model.pageIsDark,
                                        callback: () => model.jumpToPage(index)
                                    )
                                )
                               ),
                            ),
                          )
                         ),
                         SizedBox(
                           height: MediaQuery.of(context).size.height,
                           width: MediaQuery.of(context).size.width - 35,
                           child: PageView(
                             scrollDirection: Axis.vertical,
                            scrollBehavior: RemoveGlow(),
                            onPageChanged: (page){
                              model.jumpToPage(page);
                            },

                            controller: model.pageController,
                             children: List.generate(5, (index) {
                               return BlogSection(page: index, pageIsDark: model.pageIsDark,);
                             }),
                           ),
                         )
                        ]
                      ),
              ],
            ),
                      Positioned(
                        top: 30,
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width - 20,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                  onTap: model.popPage,
                                  child: Icon(
                                    Icons.chevron_left,
                                    color: model.pageIsDark ? Constants.ice2 : Constants.nord0,
                                    size: 40,
                                  )),
                              ToggleThemeButton(isDark: model.pageIsDark, voidCallback: model.togglePageIsDark)
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
          );
        });
  }
}

class BlogSection extends StatelessWidget{
  const BlogSection({Key? key, required this.page, required this.pageIsDark}):super(key: key);

  final int page;
  final bool pageIsDark;

  @override
  Widget build(BuildContext context){
    return  Padding(
      padding: const EdgeInsets.only(left: 25.0, top: 90),
      child: SizedBox(
        child: Text("""${page.toString()} Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque in dapibus ipsum. Maecenas nulla lectus, vestibulum a augue in, facilisis sagittis mi. Suspendisse nec venenatis nisi, vitae blandit massa. Fusce mollis sem et magna tincidunt, quis semper felis malesuada. Aenean sodales turpis id lacus pulvinar, nec efficitur ligula interdum. Donec turpis felis, elementum nec egestas quis, congue ut sapien. Curabitur ullamcorper ultricies lacus sit amet tempus. Mauris quis molestie arcu. Vestibulum placerat rhoncus leo, nec maximus ipsum. Cras ullamcorper nisi at commodo cursus. Praesent at velit pulvinar, volutpat elit sed, commodo mauris. Nunc vel risus vitae diam consectetur consequat eget nec leo. Phasellus vitae gravida est.
""", style: TextStyle(
        color: pageIsDark ? Constants.ice0 : Constants.nord0,
        fontSize: 17
        ),),
      ),
    );
  }
}