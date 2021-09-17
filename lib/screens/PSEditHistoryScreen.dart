import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:playstore_flutter/model/PSModel.dart';
import 'package:playstore_flutter/utils/PSColor.dart';

class PSEditHistoryScreen extends StatefulWidget {
  final ReviewModel? reviewModel;

  PSEditHistoryScreen({this.reviewModel});

  @override
  _PSEditHistoryScreenState createState() => _PSEditHistoryScreenState();
}

class _PSEditHistoryScreenState extends State<PSEditHistoryScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {}

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit History', style: boldTextStyle(size: 18)),
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: GMWhiteColor,
      ),
      body: ListView.builder(
        itemCount: 2,
        shrinkWrap: true,
        padding: EdgeInsets.all(16),
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: EdgeInsets.symmetric(vertical: 8),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(child: CircleAvatar(radius: 100, backgroundImage: AssetImage(widget.reviewModel!.img!))),
                    16.width,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.reviewModel!.name!, style: primaryTextStyle()),
                        Row(
                          children: [
                            RatingBarWidget(
                              itemCount: 5,
                              rating: 1,
                              size: 15.0,
                              spacing: 2.0,
                              activeColor: psColorGreen,
                              allowHalfRating: false,
                              onRatingChanged: (v) {},
                            ),
                            8.width,
                            Text(widget.reviewModel!.date!, style: primaryTextStyle(size: 12)),
                          ],
                        ),
                        16.height,
                        Text(widget.reviewModel!.review!, style: secondaryTextStyle()),
                      ],
                    ).expand(),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
