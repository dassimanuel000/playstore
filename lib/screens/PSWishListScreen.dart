import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:playstore_flutter/utils/AppWidget.dart';
import 'package:playstore_flutter/utils/PSImages.dart';

class PSWishListScreen extends StatefulWidget {
  static String tag = '/PSWishilistScreen';

  @override
  PSWishListScreenState createState() => PSWishListScreenState();
}

class PSWishListScreenState extends State<PSWishListScreen> {
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
        elevation: 1,
        title: Text('Wishlist', style: boldTextStyle()),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          commonCacheImageWidget(PS_Pubg, width: 200, height: 200),
          12.height,
          Text('Start dreaming', style: boldTextStyle()),
          4.height,
          Text('Keep track of all the stuff you want.Tap the bookmark icon \n next to items you like,and we\'ll track them here.', style: TextStyle(fontSize: 12), textAlign: TextAlign.center),
        ],
      ).center(),
    );
  }
}
