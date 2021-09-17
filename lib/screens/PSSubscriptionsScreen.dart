import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:playstore_flutter/utils/AppWidget.dart';
import 'package:playstore_flutter/utils/PSImages.dart';

class PSSubscriptionsScreen extends StatefulWidget {
  static String tag = '/PSSubscriptionsScreen';

  @override
  PSSubscriptionsScreenState createState() => PSSubscriptionsScreenState();
}

class PSSubscriptionsScreenState extends State<PSSubscriptionsScreen> {
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
        title: Text('Subscriptions', style: boldTextStyle()),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              commonCacheImageWidget(PS_SubwaySurfer, width: 200, height: 200),
              8.height,
              Text('Discover Subscriptions', style: boldTextStyle()),
              8.height,
              Text('You can sign up for subscriptions in your favorite \napps and games and manage them in App', textAlign: TextAlign.center),
              16.height,
              RaisedButton(color: Colors.green, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)), onPressed: () {}, child: Text('Get started', style: TextStyle(color: Colors.white))),
            ],
          ),
        ),
      ),
    );
  }
}
