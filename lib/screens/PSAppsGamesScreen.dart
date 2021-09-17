import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:playstore_flutter/screens/PSInstalledFragment.dart';
import 'package:playstore_flutter/screens/PSLibraryFragment.dart';
import 'package:playstore_flutter/screens/PSUpdatesFragments.dart';
import 'package:playstore_flutter/utils/PSColor.dart';

class PSAppsGamesScreen extends StatefulWidget {
  static String tag = '/PSAppsgamesScreen';

  @override
  PSAppsGamesScreenState createState() => PSAppsGamesScreenState();
}

class PSAppsGamesScreenState extends State<PSAppsGamesScreen> {
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
          title: Text('My apps & games', style: boldTextStyle()),
          backgroundColor: Colors.white,
          elevation: 0,
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
                    Padding(padding: EdgeInsets.only(bottom: 12), child: Text('Updates')),
                    Padding(padding: EdgeInsets.only(bottom: 12), child: Text('Installed')),
                    Padding(padding: EdgeInsets.only(bottom: 12), child: Text('Library')),
                  ],
                ),
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            PSUpdatesFragments(),
            PSInstalledFragment(),
            PSLibraryFragment(),
          ],
        ),
      ),
    );
  }
}
