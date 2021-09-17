import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:playstore_flutter/model/PSModel.dart';
import 'package:playstore_flutter/utils/AppWidget.dart';
import 'package:playstore_flutter/utils/PSColor.dart';
import 'package:playstore_flutter/utils/PSConstants.dart';
import 'package:playstore_flutter/utils/PSDataProvider.dart';

class PSUpdatesFragments extends StatefulWidget {
  static String tag = '/PSUpdatesFragments';

  @override
  PSUpdatesFragmentsState createState() => PSUpdatesFragmentsState();
}

class PSUpdatesFragmentsState extends State<PSUpdatesFragments> {
  List<PSMyAppsModel> libraryList = getLibraryList();
  List<PSMyAppsModel> recentlyUpdateList = getLibraryList();

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
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                visualDensity: VisualDensity(horizontal: -4, vertical: -4),
                title: Text('No problems found', style: primaryTextStyle()),
                leading: Icon(Icons.shield, size: 25, color: psColorGreen).paddingOnly(left: 8, top: 8),
                subtitle: Text('Apps scanned at 3:02 PM', style: secondaryTextStyle(size: 12)),
                trailing: Icon(Icons.refresh, color: psColorGreen).paddingOnly(right: 8),
              ),
              Divider(thickness: 1, indent: 20, endIndent: 20),
              ListTile(
                title: Text('Updates pending ($maxItemCount)'),
                subtitle: Text('Auto-update is turned on'),
                trailing: Container(
                  child: RaisedButton(
                    color: psColorGreen,
                    child: Text('Update all', style: boldTextStyle(color: white)),
                    onPressed: () {},
                  ),
                ).cornerRadiusWithClipRRect(5),
              ),
              ListView.builder(
                itemCount: libraryList.length,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  PSMyAppsModel data = libraryList[index];

                  return Column(
                    children: [
                      Row(
                        children: [
                          commonCacheImageWidget(data.appLogo, fit: BoxFit.cover, height: 40, width: 40).cornerRadiusWithClipRRect(5).paddingOnly(left: 16, top: 16),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                data.title!,
                                overflow: TextOverflow.ellipsis,
                                style: secondaryTextStyle(),
                              ).paddingOnly(top: 16, left: 16),
                              Text(data.appSize!, style: secondaryTextStyle(size: 12), overflow: TextOverflow.ellipsis).paddingLeft(16),
                            ],
                          ).expand(),
                          IconButton(
                            onPressed: () {
                              if (!data.isExpanded) {
                                data.isExpanded = true;
                              } else {
                                data.isExpanded = false;
                              }
                              setState(() {});
                            },
                            icon: libraryList[index].isExpanded ? Icon(Icons.keyboard_arrow_up) : Icon(Icons.keyboard_arrow_down_outlined).paddingOnly(top: 8),
                          ),
                          Container(
                            width: 80,
                            height: 26,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(3), border: Border.all(color: Colors.grey)),
                            child: Text(data.isUpdate ? 'Update' : 'Open', style: TextStyle(color: psColorGreen)).center(),
                          ).paddingOnly(right: 8),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.all(16),
                        padding: EdgeInsets.all(16),
                        width: context.width(),
                        decoration: boxDecoration(bgColor: Colors.greenAccent.withOpacity(0.1), radius: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(Icons.settings_rounded).paddingOnly(left: 16),
                                16.width,
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('WHAT\'S NEW', style: primaryTextStyle(size: 14, color: Colors.green)),
                                    Text(
                                      data.information!,
                                      overflow: TextOverflow.ellipsis,
                                      style: primaryTextStyle(size: 14, color: Colors.green),
                                      maxLines: 3,
                                    ).paddingRight(16),
                                  ],
                                ).expand(),
                              ],
                            ),
                          ],
                        ),
                      ).visible(data.isExpanded),
                    ],
                  );
                },
              ),
              16.height,
              Text('Recently Updated ($maxItemCount)', style: boldTextStyle()).paddingOnly(left: 16, top: 16),
              16.height,
              ListView.builder(
                itemCount: recentlyUpdateList.length,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  PSMyAppsModel data = recentlyUpdateList[index];

                  return Column(
                    children: [
                      Row(
                        children: [
                          commonCacheImageWidget(data.appLogo, fit: BoxFit.cover, height: 40, width: 40).cornerRadiusWithClipRRect(5).paddingOnly(left: 16, top: 16).cornerRadiusWithClipRRect(4),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                data.title!,
                                overflow: TextOverflow.ellipsis,
                                style: secondaryTextStyle(),
                              ).paddingOnly(top: 16, left: 16),
                              Text(data.upaDteSubtitle!, style: secondaryTextStyle(size: 12), overflow: TextOverflow.ellipsis).paddingLeft(16),
                            ],
                          ).expand(),
                          IconButton(
                            onPressed: () {
                              if (!data.isExpanded) {
                                data.isExpanded = true;
                              } else {
                                data.isExpanded = false;
                              }
                              setState(() {});
                            },
                            icon: recentlyUpdateList[index].isExpanded ? Icon(Icons.keyboard_arrow_up) : Icon(Icons.keyboard_arrow_down_outlined),
                          ),
                          Container(
                            width: 80,
                            height: 26,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(3), border: Border.all(color: Colors.grey)),
                            child: FlatButton(
                              onPressed: () {},
                              child: Text("Open", style: TextStyle(color: psColorGreen)),
                            ),
                          ).paddingOnly(right: 8),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.all(16),
                        padding: EdgeInsets.all(16),
                        width: context.width(),
                        decoration: boxDecoration(bgColor: Colors.greenAccent.withOpacity(0.3), radius: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(Icons.settings_rounded).paddingOnly(left: 16),
                                16.width,
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('WHAT\'S NEW'),
                                    Text(
                                      data.information!,
                                      overflow: TextOverflow.ellipsis,
                                      style: primaryTextStyle(size: 14),
                                      maxLines: 3,
                                    ).paddingRight(16),
                                  ],
                                ).expand(),
                              ],
                            ),
                          ],
                        ),
                      ).visible(data.isExpanded),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
