import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:playstore_flutter/model/PSAppbarModel.dart';
import 'package:playstore_flutter/screens/PSDetailScreen.dart';
import 'package:playstore_flutter/utils/AppWidget.dart';

class PSGameViewAllScreen extends StatefulWidget {
  static String tag = '/PSGameDetailsScreen';
  final PSAppbarModel? data;

  PSGameViewAllScreen({this.data});

  @override
  PSGameViewAllScreenState createState() => PSGameViewAllScreenState();
}

class PSGameViewAllScreenState extends State<PSGameViewAllScreen> {
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
    return Center(
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.data!.name!, style: boldTextStyle()),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(8),
          child: Wrap(
            children: widget.data!.list!.map((data) {
              return Container(
                width: context.width() * 0.48,
                padding: EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    commonCacheImageWidget(data.imgMain, height: 150, fit: BoxFit.cover).cornerRadiusWithClipRRect(10).onTap(() {
                      PSDetailScreen(data: data).launch(context);
                    }),
                    8.height,
                    Text(data.title!, style: primaryTextStyle(size: 13), overflow: TextOverflow.ellipsis, maxLines: 2),
                    Text(data.appSize.toString() + 'MB', style: secondaryTextStyle(size: 11)),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
