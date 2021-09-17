import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:playstore_flutter/components/PSGEditorChoiceFragment.dart';
import 'package:playstore_flutter/components/PSGEventsFragment.dart';
import 'package:playstore_flutter/components/PSGameForYouComponent.dart';
import 'package:playstore_flutter/components/PSGpremiumFragment.dart';
import 'package:playstore_flutter/components/PSTopChartsFragment.dart';
import 'package:playstore_flutter/model/PSAppbarModel.dart';
import 'package:playstore_flutter/model/PSModel.dart';
import 'package:playstore_flutter/screens/PSGameViewAllScreen.dart';
import 'package:playstore_flutter/utils/PSColor.dart';
import 'package:playstore_flutter/utils/PSDataProvider.dart';
import 'package:playstore_flutter/utils/PSWidgets.dart';

class PSGamesScreen extends StatefulWidget {
  static String tag = '/PSGamesScreen';

  final List<PSAppbarModel> list = getGameList;

  @override
  PSGamesScreenState createState() => PSGamesScreenState();
}

List<CategoriesApps> categoriesList = getCategoriesList();

class PSGamesScreenState extends State<PSGamesScreen> with TickerProviderStateMixin {
  List<PSAppbarModel> list = getGameList;

  TabController? _tabController;

  int tabIndex = 0;
  String button = "Install";

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    _tabController = TabController(vsync: this, initialIndex: tabIndex, length: getGameList.length);
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
                  labelStyle: boldTextStyle(size: 12),
                  controller: _tabController,
                  indicatorColor: Colors.green,
                  labelColor: psColorGreen,
                  isScrollable: true,
                  tabs: getGameList.map((e) {
                    return Tab(text: e.name.validate());
                  }).toList(),
                  onTap: (i) {
                    tabIndex = i;
                    setState(() {});
                  },
                ),
              ),
            ),
            ForYouList(context, tabIndex, list)!,
          ],
        ),
      ),
    );
  }
}

Widget? ForYouList(BuildContext context, int tabIndex, List<PSAppbarModel> list) {
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
                    PSGameViewAllScreen(data: e).launch(context);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(e.name!, style: boldTextStyle(size: 18)),
                      Icon(Icons.arrow_forward_rounded),
                    ],
                  ).paddingOnly(left: 16, right: 16)),
              16.height,
              SingleChildScrollView(
                padding: EdgeInsets.only(left: 8, right: 8),
                child: Row(
                  children: e.list!.map((e) {
                    return Container(
                      child: PSGameForYouComponent(e),
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
  } else if (tabIndex == 1) {
    return PSTopChartsFragment(tabIndex).paddingBottom(16);
  } else if (tabIndex == 2) {
    return PSGEventsFragment(tabIndex).paddingBottom(4);
  } else if (tabIndex == 3) {
    return Column(
      children: list[tabIndex].categories!.map((e) {
        return Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              16.height,
              InkWell(
                onTap: () {
                  PSGameViewAllScreen(data: e).launch(context);
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
                      child: PSGpremiumFragment(e),
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
  } else if (tabIndex == 4) {
    return CategoriesList(data: categoriesList);
  } else if (tabIndex == 5) {
    return PSGEditorChoiceFragment(tabIndex);
  }
}
