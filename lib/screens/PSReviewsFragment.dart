import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:playstore_flutter/screens/PSPostedFragment.dart';
import 'package:playstore_flutter/screens/PSUreViewedFragment.dart';
import 'package:playstore_flutter/utils/PSColor.dart';

class PSReviewsFragment extends StatefulWidget {
  static String tag = '/PSReviewsFragment';

  @override
  PSReviewsFragmentState createState() => PSReviewsFragmentState();
}

class PSReviewsFragmentState extends State<PSReviewsFragment> {
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
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: Text('Reviews', style: boldTextStyle()),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(40),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey))),
                child: TabBar(
                  indicatorSize: TabBarIndicatorSize.label,
                  indicatorColor: psColorGreen,
                  labelColor: psColorGreen,
                  unselectedLabelColor: Colors.black87,
                  isScrollable: true,
                  tabs: [
                    Text('UnreViewed').paddingOnly(bottom: 12),
                    Text('Posted').paddingOnly(bottom: 12),
                  ],
                ),
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            PSUreViewedFragment(),
            PSPostedFragment(),
          ],
        ),
      ),
    );
  }
}
