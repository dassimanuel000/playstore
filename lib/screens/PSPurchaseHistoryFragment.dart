import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:playstore_flutter/utils/AppWidget.dart';
import 'package:playstore_flutter/utils/PSColor.dart';
import 'package:playstore_flutter/utils/PSImages.dart';

class PSPurchaseHistoryFragment extends StatefulWidget {
  static String tag = '/PSPurchaseHistoryFragment';

  @override
  PSPurchaseHistoryFragmentState createState() => PSPurchaseHistoryFragmentState();
}

class PSPurchaseHistoryFragmentState extends State<PSPurchaseHistoryFragment> {
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
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            commonCacheImageWidget(PS_playStore, width: 200, height: 200),
            8.height,
            Text('Keep track of purchases', style: boldTextStyle(), textAlign: TextAlign.center),
            4.height,
            Text('All your play purchases will show up \n here.You can also set up a budget \n to help you manage your spending', textAlign: TextAlign.center),
            8.height,
            RaisedButton(
              color: psColorGreen,
              onPressed: () {},
              child: Text('Set budget', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ).center(),
    );
  }
}
