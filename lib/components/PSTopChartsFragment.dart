import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:playstore_flutter/model/PSAppbarModel.dart';
import 'package:playstore_flutter/screens/PSDetailScreen.dart';
import 'package:playstore_flutter/utils/AppWidget.dart';

class PSTopChartsFragment extends StatefulWidget {
  static String tag = '/TopCharts';
  final int tabIndex;

  PSTopChartsFragment(this.tabIndex);

  @override
  PSTopChartsFragmentState createState() => PSTopChartsFragmentState();
}

class PSTopChartsFragmentState extends State<PSTopChartsFragment> {
  var list = getGameList[1].categories![0].list;
  int number = 1;
  bool isInstall = false;

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
    return Column(
      children: [
        Row(
          children: [
            Text('Show installed apps', style: primaryTextStyle()).expand(),
            Switch(
              value: isInstall,
              onChanged: (s) {
                isInstall = s;
                setState(() {});
              },
            )
          ],
        ).paddingOnly(left: 16, right: 16),
        Container(
          height: 55,
          child: ListView.builder(
            padding: EdgeInsets.only(left: 8, right: 8),
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: getGameList[widget.tabIndex].categories!.length,
            itemBuilder: (context, index) {
              return FlatButton(
                shape: RoundedRectangleBorder(side: BorderSide(color: Colors.grey[400]!), borderRadius: BorderRadius.circular(20)),
                highlightColor: Colors.green[100],
                onPressed: () {
                  list = getGameList[widget.tabIndex].categories![index].list;
                  setState(() {});
                },
                child: Text(getGameList[widget.tabIndex].categories![index].name!, style: primaryTextStyle()),
              ).paddingOnly(top: 14, left: 8, right: 8);
            },
          ),
        ),
        list!.isNotEmpty
            ? ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: list!.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                      child: Column(
                    children: [
                      16.height,
                      Row(
                        children: [
                          8.width,
                          commonCacheImageWidget(list![index].imgLogo, height: 50, width: 60, fit: BoxFit.cover).cornerRadiusWithClipRRect(10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(list![index].title!, style: boldTextStyle()).paddingOnly(left: 16),
                              Text(list![index].subTitle!, style: secondaryTextStyle()).paddingOnly(left: 16),
                              Row(
                                children: [
                                  Text(list![index].rating.toString(), style: secondaryTextStyle()).paddingOnly(left: 16),
                                  Icon(Icons.star, size: 10),
                                  Text(list![index].appSize.toString()).paddingOnly(left: 16),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ).onTap(() {
                        PSDetailScreen(data: list![index]).launch(context);
                      })
                    ],
                  ).paddingOnly(left: 16));
                })
            : SizedBox()
      ],
    );
  }
}
