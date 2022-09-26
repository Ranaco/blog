import 'package:flutter/material.dart';
import 'package:log/ui/widgets/constants.dart';
import 'package:stacked/stacked.dart';
import './blog_page_viewmodel.dart';

class BlogPageView extends StatelessWidget {
  const BlogPageView({Key? key, required this.tag}) : super(key: key);
  final String tag;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<BlogPageViewModel>.reactive(
        viewModelBuilder: () => BlogPageViewModel(),
        builder: (context, model, child) {
          return Hero(
            tag: tag,
            child: Scaffold(
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
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    GestureDetector(
                                        child: Icon(
                                          Icons.chevron_left,
                                          color: Constants.ice2,
                                          size: 40,
                                        ),
                                        onTap: model.popPage),

                                  ],
                                ),
                              ),
                            ],
                          ))),
                ),
              ],
            )),
          );
        });
  }
}
