import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:playstore_flutter/components/PSMReleaseFragment.dart';
import 'package:playstore_flutter/components/PSMStudiosFragment.dart';
import 'package:playstore_flutter/components/PSMTopSellingFragment.dart';
import 'package:playstore_flutter/components/PSMoviesForYouComponent.dart';
import 'package:playstore_flutter/model/PSAppbarModel.dart';
import 'package:playstore_flutter/model/PSModel.dart';
import 'package:playstore_flutter/screens/PSMoviesViewAllScreen.dart';
import 'package:playstore_flutter/utils/PSDataProvider.dart';
import 'package:playstore_flutter/utils/PSWidgets.dart';

class PSMoviesScreen extends StatefulWidget {
  final PSGameModel? data;

  PSMoviesScreen({this.data});

  static String tag = '/PSMoviesScreen';

  @override
  PSMoviesScreenState createState() => PSMoviesScreenState();
}

class PSMoviesScreenState extends State<PSMoviesScreen> with TickerProviderStateMixin {
  List<PSAppbarModel> list = movieList;
  List<CategoriesApps> genresList = moviesCategoriesApps();

  TabController? _tabController;
  int tabIndex = 0;
  int number = 1;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    _tabController = TabController(vsync: this, initialIndex: tabIndex, length: movieList.length);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController?.dispose();
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: context.height(),
        padding: EdgeInsets.only(top: 8),
        child: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 50,
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey[300]!))),
                child: TabBar(
                  indicatorSize: TabBarIndicatorSize.label,
                  unselectedLabelColor: Colors.black54,
                  controller: _tabController,
                  indicatorColor: Colors.red,
                  labelStyle: boldTextStyle(size: 12),
                  labelColor: Colors.red,
                  isScrollable: true,
                  tabs: movieList.map((e) {
                    return Tab(text: e.name.validate());
                  }).toList(),
                  onTap: (i) {
                    tabIndex = i;
                    setState(() {});
                  },
                ),
              ),
            ),
            ForYouList(context, tabIndex, list, genresList)!,
          ],
        )));
  }
}

Widget? ForYouList(BuildContext context, int tabIndex, List<PSAppbarModel> list, List<CategoriesApps> genresList) {
  if (tabIndex == 0) {
    return Column(
      children: list[tabIndex].categories!.map((e) {
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
                    return PSMoviesForYouComponent(e, list);
                  }).toList(),
                ),
                scrollDirection: Axis.horizontal,
              ),
            ],
          ),
        );
      }).toList(),
    ).paddingBottom(16);
  } else if (tabIndex == 1) {
    return PSMTopSellingFragment(tabIndex);
  } else if (tabIndex == 2) {
    return PSMReleaseFragment(tabIndex);
  } else if (tabIndex == 3) {
    return CategoriesList(data: genresList, isMovies: true);
  } else if (tabIndex == 4) {
    return Column(
      children: list[tabIndex].categories!.map((e) {
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
                  children: [
                    Text(e.name!, style: boldTextStyle(size: 18)),
                    Icon(Icons.arrow_forward_rounded),
                  ],
                ).paddingOnly(left: 16, right: 16),
              ),
              16.height,
              SingleChildScrollView(
                padding: EdgeInsets.only(left: 8, right: 8),
                child: Row(
                  children: e.list!.map((e) {
                    return Container(
                      child: PSMStudiosFragment(e),
                    );
                  }).toList(),
                ),
                scrollDirection: Axis.horizontal,
              ),
            ],
          ),
        );
      }).toList(),
    ).paddingBottom(16);
  }
}
