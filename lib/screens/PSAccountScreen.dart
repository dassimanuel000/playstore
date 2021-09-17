import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:playstore_flutter/screens/PSPreferencesFragments.dart';
import 'package:playstore_flutter/screens/PSPurchaseHistoryFragment.dart';
import 'package:playstore_flutter/screens/PSRewardsFragment.dart';
import 'package:playstore_flutter/utils/PSColor.dart';

class PSAccountScreen extends StatefulWidget {
  static String tag = '/PSAccountScreen';

  @override
  PSAccountScreenState createState() => PSAccountScreenState();
}

class PSAccountScreenState extends State<PSAccountScreen> {
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
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: white,
          title: Text('Account', style: boldTextStyle()),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(40),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: TabBar(
                unselectedLabelColor: Colors.black54,
                labelColor: psColorGreen,
                indicatorSize: TabBarIndicatorSize.label,
                indicatorColor: psColorGreen,
                isScrollable: true,
                tabs: [
                  Tab(text: ('Preferences')),
                  Tab(text: ('Rewards')),
                  Tab(text: ('Purchase history')),
                ],
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            PSPreferencesFragment(),
            PSRewardsFragment(),
            PSPurchaseHistoryFragment(),
          ],
        ),
      ),
    );
  }
}
