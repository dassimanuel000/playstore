import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:playstore_flutter/model/PSAppbarModel.dart';
import 'package:playstore_flutter/screens/PSBooKDetailsScreen.dart';
import 'package:playstore_flutter/utils/AppWidget.dart';

class PSBookReleasesFragment extends StatefulWidget {
  final int? tabIndex;

  PSBookReleasesFragment({this.tabIndex});

  static String tag = '/BookNewRelease';

  @override
  PSBookReleasesFragmentState createState() => PSBookReleasesFragmentState();
}

class PSBookReleasesFragmentState extends State<PSBookReleasesFragment> {
  var releaseList = booksList[4].categories![0].list;
  int number = 1;

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
                      releaseList = booksList[widget.tabIndex!].categories![index].list;
                      setState(() {});
                    },
                    child: Text(booksList[widget.tabIndex!].categories![index].name!, style: primaryTextStyle()),
                  ).paddingOnly(top: 14, left: 8, right: 8);
                }),
          ),
          releaseList != null
              ? ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: releaseList!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      child: Column(
                        children: [
                          16.height,
                          Row(
                            children: [
                              8.width,
                              commonCacheImageWidget(releaseList![index].imgMain, height: 50, width: 60, fit: BoxFit.cover).cornerRadiusWithClipRRect(10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(releaseList![index].title!, style: boldTextStyle(), maxLines: 2).paddingOnly(left: 16),
                                  if (releaseList![index].subTitle != null) Text(releaseList![index].subTitle!, style: secondaryTextStyle()).paddingOnly(left: 16),
                                  Row(
                                    children: [
                                      Text(releaseList![index].rating.toString(), style: secondaryTextStyle()).paddingOnly(left: 16),
                                      Icon(Icons.star, size: 10),
                                      Text(releaseList![index].appSize.toString()).paddingOnly(left: 16),
                                    ],
                                  )
                                ],
                              ).expand(),
                            ],
                          ).onTap(() {
                            PSBookDetailsScreen(data: releaseList![index]).launch(context);
                          })
                        ],
                      ).paddingOnly(left: 16),
                    );
                  },
                )
              : SizedBox()
        ],
      ),
    );
  }
}
