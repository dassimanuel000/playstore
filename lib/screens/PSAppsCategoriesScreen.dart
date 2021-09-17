import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:playstore_flutter/components/PSAppsForYouComponent.dart';
import 'package:playstore_flutter/model/PSAppbarModel.dart';
import 'package:playstore_flutter/model/PSModel.dart';

class PSAppsCategoriesScreen extends StatefulWidget {
  final CategoriesApps? data;

  PSAppsCategoriesScreen({this.data});

  static String tag = '/PSAppsCategoriesScreen';

  @override
  PSAppsCategoriesScreenState createState() => PSAppsCategoriesScreenState();
}

class PSAppsCategoriesScreenState extends State<PSAppsCategoriesScreen> {
  List<PSAppbarModel> list = appsList;

  get tabIndex => null;

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
      appBar: AppBar(title: Text(widget.data!.name!, style: boldTextStyle())),
      body: SingleChildScrollView(
        child: Column(
          children: list[0].categories!.map((e) {
            return Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  16.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(e.name!, style: boldTextStyle(size: 18)),
                      Icon(Icons.arrow_forward_rounded),
                    ],
                  ).paddingOnly(left: 16, right: 16),
                  16.height,
                  SingleChildScrollView(
                    padding: EdgeInsets.only(left: 8, right: 8),
                    child: Row(children: e.list!.map((e) => PSAppsForYouComponent(e)).toList()),
                    scrollDirection: Axis.horizontal,
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
