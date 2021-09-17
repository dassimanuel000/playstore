import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:playstore_flutter/utils/AppWidget.dart';
import 'package:playstore_flutter/utils/PSImages.dart';

class PSPostedFragment extends StatefulWidget {
  static String tag = '/PSPostedFragment';

  @override
  PSPostedFragmentState createState() => PSPostedFragmentState();
}

class PSPostedFragmentState extends State<PSPostedFragment> {
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
      body: Container(
        child: Column(
          children: [
            commonCacheImageWidget(PS_Pubg, width: 200, height: 200).paddingOnly(top: 18),
            16.height,
            Text(
              'Your posted reviews will show up here so you can easily find and update then',
              textAlign: TextAlign.center,
            ).paddingOnly(left: 32, right: 32),
          ],
        ),
      ),
    );
  }
}
