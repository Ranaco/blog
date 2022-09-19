import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:log/ui/home_page/home_page_viewmodel.dart';
import 'package:log/ui/widgets/constants.dart';
import 'package:log/ui/widgets/post.dart';
import 'package:stacked/stacked.dart';

import '../scaffold.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({Key? key, required this.currentIndex}) : super(key: key);
  final int currentIndex;
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomePageViewModel>.reactive(
        viewModelBuilder: () => HomePageViewModel(),
        builder: (context, model, child) {
          return Center(
              child: Column(children: <Widget>[
            Text.rich(
                textAlign: TextAlign.center,
                TextSpan(
                    style: const TextStyle(), children: [
                  TextSpan(
                      text: "Discover" + currentIndex.toString(),
                      style: const TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w500,
                      )),
                  const TextSpan(
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
                  children: List.generate(5, (index) {
                    return StaggeredGridTile.fit(
                        crossAxisCellCount: 1,
                        child: Post(
                            width: MediaQuery.of(context).size.width * 0.5));
                  }),
                ),
              ),
            )
          ]));
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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        height: 35,
        width: 120,
        decoration: BoxDecoration(
            boxShadow: widget.isActive
                ? [
                    const BoxShadow(
                        color: Colors.grey,
                        blurRadius: 4,
                        offset: Offset(1, 2),
                        spreadRadius: 2),
                  ]
                : [],
            borderRadius: BorderRadius.circular(14),
            color: widget.isActive ? Colors.black : Colors.transparent,
            border: Border.all(color: Colors.black, width: 0.2)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Text(
              widget.label,
              style: TextStyle(
                  color:
                      widget.isActive ? Constants.bottomBarGrey : Colors.black),
            ),
          ),
        ),
      ),
    );
  }
}
