import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:playstore_flutter/components/PSBookAudioFragment.dart';
import 'package:playstore_flutter/components/PSBookComicsFragment.dart';
import 'package:playstore_flutter/components/PSBookReleasesFragment.dart';
import 'package:playstore_flutter/components/PSBooksForYouComponent.dart';
import 'package:playstore_flutter/components/PSBooksTopSellingFragment.dart';
import 'package:playstore_flutter/model/PSAppbarModel.dart';
import 'package:playstore_flutter/screens/PSDetailScreen.dart';
import 'package:playstore_flutter/screens/PSMoviesViewAllScreen.dart';

class PSBookScreen extends StatefulWidget {
  static String tag = '/PSBookScreen';

  final PSDetailScreen? data;

  PSBookScreen({this.data});

  @override
  PSBookScreenState createState() => PSBookScreenState();
}

class PSBookScreenState extends State<PSBookScreen> with TickerProviderStateMixin {
  List<PSAppbarModel> list = booksList;
  TabController? _tabController;
  int tabIndex = 0;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    _tabController = TabController(vsync: this, initialIndex: tabIndex, length: booksList.length);
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
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey[300]!))),
              child: TabBar(
                indicatorSize: TabBarIndicatorSize.label,
                unselectedLabelColor: Colors.black54,
                labelStyle: boldTextStyle(size: 12),
                controller: _tabController,
                indicatorColor: Colors.blue[900],
                labelColor: Colors.blue[900],
                isScrollable: true,
                tabs: booksList.map((e) => Tab(text: e.name.validate())).toList(),
                onTap: (i) {
                  tabIndex = i;
                  setState(() {});
                },
              ),
            ),
            EBookList(context, tabIndex, list)!,
          ],
        ),
      ),
    );
  }
}

Widget? EBookList(BuildContext context, int tabIndex, List<PSAppbarModel> list) {
  if (tabIndex == 0) {
    return Column(
      children: list[tabIndex].categories!.map((e) {
        return Column(
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
                    child: PSBooksForYouComponent(data: e, list: list),
                  );
                }).toList(),
              ),
              scrollDirection: Axis.horizontal,
            ),
          ],
        );
      }).toList(),
    ).paddingBottom(16);
  } else if (tabIndex == 1) {
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
                      child: PSBookAudioFragment(e),
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
  } else if (tabIndex == 2) {
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
                      child: PSBookComicsFragment(e),
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
  } else if (tabIndex == 3) {
    return PSBooksTopSpellingFragment(tabIndex: tabIndex).paddingBottom(16);
  } else if (tabIndex == 4) {
    return PSBookReleasesFragment(tabIndex: tabIndex).paddingBottom(16);
  }
}
