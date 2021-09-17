import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:playstore_flutter/model/PSAppbarModel.dart';
import 'package:playstore_flutter/screens/PSDetailScreen.dart';
import 'package:playstore_flutter/utils/AppWidget.dart';
import 'package:playstore_flutter/utils/PSColor.dart';

class PSGEventsFragment extends StatefulWidget {
  static String tag = '/Gevents';

  final int tabIndex;

  PSGEventsFragment(this.tabIndex);

  @override
  PSGEventsFragmentState createState() => PSGEventsFragmentState();
}

class PSGEventsFragmentState extends State<PSGEventsFragment> {
  bool button = false;
  List<PSAppbarModel> data = getGameList;
  var events = getGameList[2].list;

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
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      itemCount: events!.length,
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            PSDetailScreen(data: events![index]).launch(context);
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              16.height,
              Row(
                children: [
                  commonCacheImageWidget(events![index].imgLogo, height: 50, width: 50, fit: BoxFit.cover).cornerRadiusWithClipRRect(10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(events![index].title!, style: boldTextStyle(size: 12), overflow: TextOverflow.ellipsis),
                      Text(events![index].subTitle!, style: secondaryTextStyle(size: 12)),
                      Row(
                        children: [
                          Text(events![index].rating.toString(), style: secondaryTextStyle(size: 12)),
                          Icon(Icons.star, size: 10),
                          4.width,
                          Icon(Icons.add_box_rounded, size: 16),
                        ],
                      ),
                    ],
                  ).paddingOnly(left: 8).expand(),
                  Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), border: Border.all(color: Colors.grey[300]!)),
                    height: 30,
                    width: 70,
                    child: Text(
                      events![index].install! ? 'CanCel' : 'Install',
                      style: secondaryTextStyle(color: psColorGreen),
                    ).center().onTap(() {
                      setState(() {
                        if (!events![index].install!) {
                          events![index].install = true;
                        } else {
                          events![index].install = false;
                        }
                      });
                    }),
                  ).paddingOnly(right: 24)
                ],
              ),
              16.height,
              Row(
                children: [
                  Icon(Icons.event, size: 10),
                  4.width,
                  Text(events![index].event!, style: secondaryTextStyle(size: 12)),
                  4.width,
                  Text(events![index].ends!, style: secondaryTextStyle(size: 12)),
                ],
              ),
              8.height,
              Text(events![index].subTitle1!, style: secondaryTextStyle()).paddingOnly(right: 16),
              16.height,
              commonCacheImageWidget(events![index].imgMain, height: 180, width: context.width(), fit: BoxFit.cover).cornerRadiusWithClipRRect(10).paddingOnly(right: 16),
              16.height,
            ],
          ).paddingOnly(left: 16),
        );
      },
    );
  }
}
