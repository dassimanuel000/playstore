import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:playstore_flutter/utils/AppWidget.dart';
import 'package:playstore_flutter/utils/PSConstants.dart';
import 'package:playstore_flutter/utils/PSImages.dart';

class PSNotificationScreen extends StatefulWidget {
  static String tag = '/PSNotificationScreen';

  @override
  PSNotificationScreenState createState() => PSNotificationScreenState();
}

class PSNotificationScreenState extends State<PSNotificationScreen> {
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
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text('Notifications', style: boldTextStyle(size: 18)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            commonCacheImageWidget(PS_playStore, width: 200, height: 200),
            Text('You\'re all caught up', style: boldTextStyle()),
            2.height,
            Text('This is where you\'ll see notifications\n about your $PSAppName account', textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}
