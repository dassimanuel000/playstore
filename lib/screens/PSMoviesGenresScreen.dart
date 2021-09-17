import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:playstore_flutter/components/PSMoviesForYouComponent.dart';
import 'package:playstore_flutter/model/PSAppbarModel.dart';
import 'package:playstore_flutter/screens/PSMoviesViewAllScreen.dart';

class PSMoviesGenresScreen extends StatefulWidget {
  final String? title;

  PSMoviesGenresScreen({this.title});

  static String tag = '/PSMoviesGenresScreen';

  @override
  PSMoviesGenresScreenState createState() => PSMoviesGenresScreenState();
}

class PSMoviesGenresScreenState extends State<PSMoviesGenresScreen> {
  List<PSAppbarModel> list = movieList;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title!, style: boldTextStyle()),
        ),
        body: SingleChildScrollView(
            child: Column(
          children: list[0].categories!.map((e) {
            return Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  16.height,
                  InkWell(
                    onTap: () {
                      PSBookMoviesViewAllScreen(data5: e).launch(context);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Text(e.name!, style: boldTextStyle(size: 18)), Icon(Icons.arrow_forward_rounded)],
                    ).paddingOnly(left: 16, right: 16),
                  ),
                  8.height,
                  SingleChildScrollView(
                    padding: EdgeInsets.only(left: 8, right: 8),
                    child: Row(
                      children: e.list!.map((e) {
                        return Container(
                          child: PSMoviesForYouComponent(e, list),
                        );
                      }).toList(),
                    ),
                    scrollDirection: Axis.horizontal,
                  ),
                ],
              ),
            );
          }).toList(),
        )));
  }
}
