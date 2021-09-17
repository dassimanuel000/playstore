import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:playstore_flutter/model/PSAppbarModel.dart';
import 'package:playstore_flutter/model/PSModel.dart';
import 'package:playstore_flutter/screens/PSBooKDetailsScreen.dart';
import 'package:playstore_flutter/utils/AppWidget.dart';

class PSBookMoviesViewAllScreen extends StatefulWidget {
  static String tag = '/PSMoviesDetailsScreen';

  final PSAppbarModel? data5;

  PSBookMoviesViewAllScreen({this.data5});

  @override
  PSBookMoviesViewAllScreenState createState() => PSBookMoviesViewAllScreenState();
}

class PSBookMoviesViewAllScreenState extends State<PSBookMoviesViewAllScreen> {
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
        title: Text(widget.data5!.name!, style: boldTextStyle()),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //SizedBox(),
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: widget.data5!.list!.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, crossAxisSpacing: 4, mainAxisSpacing: 4, childAspectRatio: MediaQuery.of(context).size.width / 600),
              itemBuilder: (BuildContext context, int index) {
                PSGameModel data = widget.data5!.list![index];

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    commonCacheImageWidget(data.imgMain, height: 120, width: 100, fit: BoxFit.cover).cornerRadiusWithClipRRect(10),
                    4.height,
                    Text(data.title!, style: secondaryTextStyle(size: 13), overflow: TextOverflow.ellipsis, maxLines: 1),
                    Text('₹' + data.appSize.toString(), style: secondaryTextStyle(size: 11)),
                  ],
                ).onTap(() {
                  log(data);
                  PSBookDetailsScreen(data: data).launch(context);
                });
              },
            ).paddingOnly(left: 16, right: 16, top: 16),
          ],
        ),
      ),
    );
  }
}
