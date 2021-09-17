import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:playstore_flutter/model/PSModel.dart';
import 'package:playstore_flutter/utils/AppWidget.dart';
import 'package:playstore_flutter/utils/PSColor.dart';
import 'package:playstore_flutter/utils/PSConstants.dart';
import 'package:playstore_flutter/utils/PSDataProvider.dart';

class PSLibraryFragment extends StatefulWidget {
  static String tag = '/PSLibraryFragment';

  @override
  PSLibraryFragmentState createState() => PSLibraryFragmentState();
}

class PSLibraryFragmentState extends State<PSLibraryFragment> {
  List<PSMyAppsModel> libraryList = getLibraryList();

  int? group1 = 1;

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
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  child: ListTile(title: Text('Not on this device', style: boldTextStyle()), subtitle: Text('smith.bhavsar@gmail.com')),
                ).expand(),
                12.width,
                Text('Recent', style: primaryTextStyle()).onTap(() async {
                  await removeDialogBox(context);
                  setState(() {});
                }),
                4.width,
                IconButton(
                  icon: Icon(Icons.sort),
                  onPressed: () {
                    setState(() {
                      recentDialogBox(context);
                    });
                  },
                )
              ],
            ),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: maxItemCount,
              itemBuilder: (context, index) {
                PSMyAppsModel data = libraryList[index % libraryList.length];

                return Container(
                  width: context.width(),
                  child: Row(
                    children: [
                      Container(
                        child: ListTile(
                          leading: commonCacheImageWidget(data.appLogo, fit: BoxFit.cover, height: 40, width: 40).cornerRadiusWithClipRRect(4),
                          title: Text(data.title!, overflow: TextOverflow.ellipsis, style: secondaryTextStyle(size: 14)),
                          subtitle: Text(data.subTitle!, style: secondaryTextStyle(size: 12)),
                        ),
                      ).expand(),
                      Container(
                        decoration: boxDecoration(color: grey, bgColor: Colors.transparent, radius: 4),
                        padding: EdgeInsets.only(left: 16, right: 16, bottom: 4, top: 4),
                        child: Text('Install', style: primaryTextStyle(color: psColorGreen)),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 2),
                        child: IconButton(
                          icon: Icon(Icons.close),
                          onPressed: () async {
                            bool isDelete = await (removeDialogBox(context));
                            if (isDelete) {
                              libraryList.removeAt(index);
                            } else {}
                            setState(() {});
                          },
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Future removeDialogBox(BuildContext context) async {
    return await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          content: Container(
            height: 200,
            width: 400,
            child: Column(
              children: [
                Text('Remove "A to Z Computer Shortcuts" ? ', style: boldTextStyle()).paddingOnly(top: 16, left: 16),
                Text('It won\'t appear in "My apps & games" anymore,but it will still be available on App ', style: secondaryTextStyle()).paddingOnly(left: 16, top: 8, right: 8),
                16.height,
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    FlatButton(
                      minWidth: 10,
                      height: 10,
                      onPressed: () {
                        setState(() {
                          finish(context);
                        });
                      },
                      child: Text('Cancel', style: primaryTextStyle(color: psColorGreen)),
                    ),
                    FlatButton(
                      minWidth: 10,
                      height: 10,
                      onPressed: () {
                        finish(context, true);
                        setState(() {});
                      },
                      child: Text('Remove', style: primaryTextStyle(color: psColorGreen)),
                    )
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Future recentDialogBox(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, state) {
            return AlertDialog(
              contentPadding: EdgeInsets.zero,
              content: Container(
                height: 150,
                width: 200,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Sort By', style: boldTextStyle()).paddingOnly(left: 16, top: 16),
                    Row(
                      children: [
                        Radio(
                          activeColor: psColorGreen,
                          value: 1,
                          groupValue: group1,
                          onChanged: (dynamic val) {
                            state(() {
                              group1 = val;
                            });
                          },
                        ),
                        Text('Recent', style: boldTextStyle())
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                          activeColor: psColorGreen,
                          value: 2,
                          groupValue: group1,
                          onChanged: (dynamic val) {
                            state(() {
                              libraryList.sort((a, b) => a.title!.toLowerCase().compareTo(b.title!.toLowerCase()));
                              group1 = val;
                              finish(context);
                              setState(() {});
                            });
                          },
                        ),
                        Text('Alphabetical', style: boldTextStyle())
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
