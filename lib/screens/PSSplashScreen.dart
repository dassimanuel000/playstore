import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:playstore_flutter/screens/PSDashboardScreen.dart';
import 'package:playstore_flutter/utils/AppWidget.dart';
import 'package:playstore_flutter/utils/PSConstants.dart';

class PSSplashScreen extends StatefulWidget {
  static String tag = '/PSSplashScreen';

  @override
  PSSplashScreenState createState() => PSSplashScreenState();
}

class PSSplashScreenState extends State<PSSplashScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    checkFirstSeen();
  }

  Future checkFirstSeen() async {
    await Future.delayed(Duration(seconds: 2));
    finish(context);
    PSDashboardScreen().launch(context);
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          commonCacheImageWidget("images/playStore/app_ic_PlayStore.png", height: 90, width: 90),
          8.height,
          Text(PSAppName, style: boldTextStyle(size: 25)),
        ],
      ).center(),
    );
  }
}
