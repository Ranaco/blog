import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:log/ui/home_page/home_page_viewmodel.dart';
import 'package:log/ui/theme/theme_provider.dart';
import 'package:log/ui/widgets/constants.dart';
import 'package:log/ui/widgets/post.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';


class HomePageView extends StatelessWidget {
  const HomePageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    const images = [
      'assets/images/img1.jpeg',
      'assets/images/img2.jpeg',
      'assets/images/img3.jpeg',
      'assets/images/img4.jpeg',
      'assets/images/img5.jpeg',
    ];
    return ViewModelBuilder<HomePageViewModel>.reactive(
        viewModelBuilder: () => HomePageViewModel(),
        builder: (context, model, child) {
          return Center(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 25),
                child: Column(children: <Widget>[
            const Text.rich(
                  textAlign: TextAlign.center,
                  TextSpan(
                      style: TextStyle(), children: [
                    TextSpan(
                        text: "Discover",
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w500,
                        )),
                    TextSpan(
                        text: "\nArticles, blogs and much more....",
                        style: TextStyle(color: Colors.grey))
                  ])),
            Padding(
                padding: const EdgeInsets.only(top: 30),
                child: SizedBox(
                  width: double.infinity,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: List.generate(
                          5,
                          (index) => GestureDetector(
                              onTap: () {
                                model.changeTab(index);
                              },
                              child: CustomTabs(
                                  label: 'This is the $index',
                                  isActive:
                                      index == model.currentTab ? true : false))),
                    ),
                  ),
                ),
            ),
            Expanded(
                child: SingleChildScrollView(
                  child: StaggeredGrid.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: 4,
                    crossAxisSpacing: 4,
                    children: List.generate(images.length, (index) {
                      return StaggeredGridTile.fit(
                          crossAxisCellCount: 1,
                          child: Hero(
                            tag: images[index],
                            child: Material(
                              color: Colors.transparent,
                              child: Post(
                                callback: (){
                                  model.takeToProfilePage(images[index]);
                                },
                                postString: images[index],
                                  width: MediaQuery.of(context).size.width * 0.1),
                            ),
                          ));
                    }),
                  ),
                ),
            )
          ]),
              ));
        });
  }
}

class CustomTabs extends StatefulWidget {
  const CustomTabs({Key? key, required this.label, required this.isActive})
      : super(key: key);
  final String label;
  final bool isActive;

  @override
  State<CustomTabs> createState() => _CustomTabsState();
}

class _CustomTabsState extends State<CustomTabs> {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ThemeProvider themeProvider, child){
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          height: 35,
          width: 120,
          decoration: BoxDecoration(
              boxShadow: widget.isActive
                  ? [
                BoxShadow(
                    color: ThemeProvider.useColorMode(Constants.nord0, Colors.grey),
                    blurRadius: 4,
                    offset: const Offset(1, 2),
                    spreadRadius: 2),
              ]
                  : [],
              borderRadius: BorderRadius.circular(14),
              color: widget.isActive ? ThemeProvider.useColorMode(Constants.nord3, Colors.grey) : Colors.transparent,
              border: Border.all(color: ThemeProvider.useColorMode(Colors.grey.shade600, Colors.black), width: 0.2)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                widget.label,
                style: TextStyle(
                    color:
                    widget.isActive ? Constants.ice2 : ThemeProvider.useColorMode(Colors.grey, Colors.black)),
              ),
            ),
          ),
        ),
      );
    });
  }
}
