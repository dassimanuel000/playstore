import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:playstore_flutter/utils/AppWidget.dart';
import 'package:playstore_flutter/utils/PSColor.dart';
import 'package:playstore_flutter/utils/PSImages.dart';

class PSRewardsFragment extends StatefulWidget {
  static String tag = '/PSRewardsFragment';

  @override
  PSRewardsFragmentState createState() => PSRewardsFragmentState();
}

class PSRewardsFragmentState extends State<PSRewardsFragment> {
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
            commonCacheImageWidget(PS_SubwaySurfer, width: 200, height: 200),
            8.height,
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Text('You\'re all Caught up', style: boldTextStyle()),
            ),
            4.height,
            Text('Check back periodically for special deals\n and free items, or redeem a promo code.', textAlign: TextAlign.center),
            8.height,
            RaisedButton(
              color: psColorGreen,
              onPressed: () {},
              child: Text('Redeem promo code', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ).center(),
    );
  }
}
