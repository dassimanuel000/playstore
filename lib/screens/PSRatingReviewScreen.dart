import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:playstore_flutter/model/PSModel.dart';
import 'package:playstore_flutter/screens/PSEditHistoryScreen.dart';
import 'package:playstore_flutter/utils/AppWidget.dart';
import 'package:playstore_flutter/utils/PSColor.dart';
import 'package:playstore_flutter/utils/PSDataProvider.dart';

class PSRatingReviewScreen extends StatefulWidget {
  final ReviewModel? data;
  final PSGameModel? data1;

  PSRatingReviewScreen({this.data, this.data1});

  @override
  _PSRatingReviewScreenState createState() => _PSRatingReviewScreenState();
}

class _PSRatingReviewScreenState extends State<PSRatingReviewScreen> {
  List<String> list = ['best survival game', 'connection error', 'network issue', 'expansion pack', 'many bugs', 'glitches'];
  List<ReviewModel> reviewList = getReviewList1();
  List<RattingModel> ratingList = getRatingList();

  String? radioValue = 'Most relevant';
  String? name = "All";

  int? selectedRadio;
  int isSelected = 0;
  int? isSelectedReviewTopic;

  bool? versionCheckedValue = false;
  bool? deviceCheckedValue = false;
  bool changeYesColor = false;
  bool changeNoColor = false;

  @override
  void initState() {
    super.initState();
    init();
    selectedRadio = 0;
  }

  init() async {}

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  _addToTaskDialog(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
          return AlertDialog(
            contentPadding: EdgeInsets.all(16),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Sort review by', style: boldTextStyle(size: 20)),
                16.height,
                RadioListTile(
                  title: Text('Most relevant', style: primaryTextStyle()),
                  value: 'Archive',
                  dense: true,
                  groupValue: radioValue,
                  onChanged: (dynamic value) {
                    radioValue = value;
                    setState(() {});
                  },
                ),
                RadioListTile(
                  title: Text('Most recent', style: primaryTextStyle()),
                  value: 'Delete',
                  groupValue: radioValue,
                  onChanged: (dynamic value) {
                    radioValue = value;
                    setState(() {});
                  },
                ),
                16.height,
                Text('Show reviews for', style: boldTextStyle(size: 20)),
                16.height,
                CheckboxListTile(
                  contentPadding: EdgeInsets.all(0),
                  title: Text("Latest version"),
                  value: versionCheckedValue,
                  controlAffinity: ListTileControlAffinity.leading,
                  onChanged: (bool? newValue) {
                    setState(() {
                      versionCheckedValue = newValue;
                    });
                  },
                ),
                CheckboxListTile(
                  contentPadding: EdgeInsets.all(0),
                  title: Text("This device model"),
                  value: deviceCheckedValue,
                  controlAffinity: ListTileControlAffinity.leading,
                  onChanged: (bool? newValue) {
                    setState(() {
                      deviceCheckedValue = newValue;
                    });
                  },
                ),
              ],
            ),
            actions: [
              FlatButton(
                child: Text('CANCEL'),
                onPressed: () {
                  finish(context);
                },
              ),
              FlatButton(
                child: Text('APPLY'),
                onPressed: () {
                  finish(context);
                },
              )
            ],
          );
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: GMWhiteColor,
        title: Row(
          children: [
            Container(
              child: commonCacheImageWidget(widget.data1!.imgMain, width: 50, height: 50, fit: BoxFit.cover).cornerRadiusWithClipRRect(10),
            ),
            16.width,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text('Garena Free Fire: BOOYAH', style: primaryTextStyle(), maxLines: 1, overflow: TextOverflow.ellipsis).expand(),
                    Text('4.2', style: secondaryTextStyle()),
                    Icon(Icons.star, color: GMGreyColor, size: 15),
                  ],
                ),
                Text('Rating and reviews', style: secondaryTextStyle()),
              ],
            ).expand(),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            16.height,
            Container(
              height: 35,
              child: ListView.builder(
                padding: EdgeInsets.only(left: 16),
                itemCount: ratingList.length,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  RattingModel data = ratingList[index];

                  return Container(
                    padding: EdgeInsets.only(top: 6, bottom: 6, left: 20, right: 20),
                    margin: EdgeInsets.only(right: 16),
                    decoration: BoxDecoration(
                      border: Border.all(color: GMGreyColor, width: 0.5),
                      color: isSelected == index ? GMGreyColor.withOpacity(0.1) : GMWhiteColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        Text(data.typeRating!, style: primaryTextStyle(size: 12)),
                        4.width.visible(data.star != null),
                        Icon(data.star, color: GMGreyColor, size: 15).visible(data.star != null),
                      ],
                    ),
                  ).onTap(() {
                    name = data.typeRating;
                    isSelected = index;
                    setState(() {});
                  });
                },
              ),
            ),
            16.height,
            Text('Review topics', style: secondaryTextStyle()).paddingLeft(16),
            16.height,
            Container(
              height: 35,
              child: ListView.builder(
                padding: EdgeInsets.only(left: 16),
                itemCount: list.length,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    padding: EdgeInsets.only(top: 6, bottom: 6, left: 20, right: 20),
                    margin: EdgeInsets.only(right: 16),
                    decoration: BoxDecoration(
                      border: Border.all(color: GMGreyColor, width: 0.5),
                      color: isSelectedReviewTopic == index ? GMGreyColor.withOpacity(0.1) : GMWhiteColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(list[index], style: primaryTextStyle(size: 12)).center(),
                  ).onTap(() {
                    name = list[index];
                    isSelectedReviewTopic = index;
                    setState(() {});
                  });
                },
              ),
            ),
            16.height,
            Divider(color: GMAppDividerColor),
            Row(
              children: [
                Text(name!, style: primaryTextStyle()).expand(),
                Row(
                  children: [
                    Text('Most relevant', style: primaryTextStyle(size: 14)),
                    IconButton(icon: Icon(Icons.menu), onPressed: () {}),
                  ],
                ).onTap(() {
                  _addToTaskDialog(context);
                }),
              ],
            ).paddingOnly(left: 16, right: 16),
            16.height,
            ReviewDetailsList(reviewList: reviewList),
          ],
        ),
      ),
    );
  }
}

class ReviewDetailsList extends StatefulWidget {
  final List<ReviewModel>? reviewList;

  ReviewDetailsList({this.reviewList});

  @override
  _ReviewDetailsListState createState() => _ReviewDetailsListState();
}

class _ReviewDetailsListState extends State<ReviewDetailsList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.reviewList!.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        ReviewModel data = widget.reviewList![index];
        return Container(
          margin: EdgeInsets.symmetric(vertical: 8),
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.blueAccent,
                    radius: 20,
                    child: Text(widget.reviewList![index].name![0]),
                  ),
                  16.width,
                  Text(data.name!, style: primaryTextStyle()).expand(),
                  PopupMenuButton(onSelected: (dynamic v) {
                    if (v == 0) {
                      PSEditHistoryScreen(reviewModel: data).launch(context);
                    } else if (v == 1) {
                      Scaffold.of(context).showSnackBar(SnackBar(content: Text('Review flag as inappropriate')));
                    } else if (v == 2) {
                      Scaffold.of(context).showSnackBar(SnackBar(content: Text('Review flaged as spam')));
                    }
                  }, itemBuilder: (BuildContext context) {
                    List<PopupMenuEntry<Object>> list = [];
                    list.add(PopupMenuItem(child: Text('View edit history', style: primaryTextStyle()), value: 0));
                    list.add(PopupMenuItem(child: Text('Flag as inappropriate', style: primaryTextStyle()), value: 1));
                    list.add(PopupMenuItem(child: Text('Flag as spam', style: primaryTextStyle()), value: 2));
                    return list;
                  }),
                ],
              ),
              8.height,
              Row(
                children: [
                  RatingBarWidget(
                    itemCount: 5,
                    rating: data.rating!,
                    size: 15.0,
                    spacing: 2.0,
                    activeColor: psColorGreen,
                    allowHalfRating: false,
                    onRatingChanged: (v) {},
                  ),
                  8.width,
                  Text(data.date!, style: primaryTextStyle(size: 12)),
                ],
              ),
              8.height,
              Text(data.review!, style: secondaryTextStyle()),
              16.height,
              Row(
                children: [
                  Text('Was this review helpful?', style: secondaryTextStyle(size: 14)).expand(),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.only(right: 16, left: 16, bottom: 4, top: 4),
                        decoration: BoxDecoration(border: Border.all(color: GMGreyColor, width: 0.5), borderRadius: BorderRadius.circular(16)),
                        child: Text('Yes', style: primaryTextStyle(size: 14)),
                      ).onTap(() {
                        Scaffold.of(context).showSnackBar(SnackBar(content: Text('Thanks for the feedback')));
                      }),
                      8.width,
                      Container(
                        padding: EdgeInsets.only(right: 16, left: 16, bottom: 4, top: 4),
                        decoration: BoxDecoration(border: Border.all(color: GMGreyColor, width: 0.5), borderRadius: BorderRadius.circular(16)),
                        child: Text('No', style: primaryTextStyle(size: 14)),
                      ).onTap(() {
                        Scaffold.of(context).showSnackBar(SnackBar(content: Text('Thanks for the feedback')));
                      }),
                    ],
                  ),
                ],
              ),
              8.height,
            ],
          ),
        );
      },
    ).paddingOnly(left: 16, right: 16);
  }
}
