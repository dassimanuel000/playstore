import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:playstore_flutter/model/PSAppbarModel.dart';
import 'package:playstore_flutter/screens/PSBooKDetailsScreen.dart';
import 'package:playstore_flutter/utils/AppWidget.dart';

class PSBooksTopSpellingFragment extends StatefulWidget {
  static String tag = '/PSBooksTopSpellingFragment';
  final int? tabIndex;

  PSBooksTopSpellingFragment({this.tabIndex});

  @override
  PSBooksTopSpellingFragmentState createState() => PSBooksTopSpellingFragmentState();
}

class PSBooksTopSpellingFragmentState extends State<PSBooksTopSpellingFragment> {
  var sellingList = booksList[3].categories![0].list;

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
    return Container(
      child: Column(
        children: [
          Container(
            height: 50,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: booksList[widget.tabIndex!].categories!.length,
                itemBuilder: (context, index) {
                  return FlatButton(
                    shape: RoundedRectangleBorder(side: BorderSide(color: Colors.grey[400]!), borderRadius: BorderRadius.circular(20)),
                    highlightColor: Colors.green[100],
                    onPressed: () {
                      sellingList = booksList[widget.tabIndex!].categories![index].list;
                      setState(() {});
                    },
                    child: Text(booksList[widget.tabIndex!].categories![index].name!, style: primaryTextStyle()),
                  ).paddingOnly(top: 14, left: 8, right: 8);
                }),
          ),
          sellingList != null
              ? ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: sellingList!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                        child: Column(
                      children: [
                        16.height,
                        Row(
                          children: [
                            8.width,
                            commonCacheImageWidget(sellingList![index].imgMain, height: 50, width: 60, fit: BoxFit.cover).cornerRadiusWithClipRRect(10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(sellingList![index].title!, style: boldTextStyle(size: 14)).paddingOnly(left: 16),
                                Row(
                                  children: [
                                    Text(sellingList![index].rating.toString(), style: secondaryTextStyle()).paddingOnly(left: 16),
                                    Icon(
                                      Icons.star,
                                      size: 10,
                                    ),
                                    Text(sellingList![index].appSize.toString()).paddingOnly(left: 16),
                                  ],
                                )
                              ],
                            ).expand(),
                          ],
                        ).onTap(() {
                          PSBookDetailsScreen(data: sellingList![index]).launch(context);
                        })
                      ],
                    ).paddingOnly(left: 16));
                  })
              : SizedBox()
        ],
      ),
    );
  }
}
