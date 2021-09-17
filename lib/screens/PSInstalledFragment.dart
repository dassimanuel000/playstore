import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:playstore_flutter/model/PSModel.dart';
import 'package:playstore_flutter/screens/PSReviewsFragment.dart';
import 'package:playstore_flutter/utils/AppWidget.dart';
import 'package:playstore_flutter/utils/PSColor.dart';
import 'package:playstore_flutter/utils/PSConstants.dart';
import 'package:playstore_flutter/utils/PSDataProvider.dart';

class PSInstalledFragment extends StatefulWidget {
  static String tag = '/PSInstalledFragment';

  @override
  PSInstalledFragmentState createState() => PSInstalledFragmentState();
}

class PSInstalledFragmentState extends State<PSInstalledFragment> {
  List<PSMyAppsModel> installList = getLibraryList();

  int? group = 1;

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
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              8.height,
              Padding(
                padding: EdgeInsets.only(left: 16, top: 8),
                child: Text('Manage your apps', style: boldTextStyle()),
              ),
              ListTile(
                visualDensity: VisualDensity(horizontal: -4, vertical: -4),
                leading: Icon(Icons.all_inbox_sharp, color: Colors.black).paddingOnly(left: 8, top: 8),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Storage', style: boldTextStyle(size: 14)),
                    Text('88% used - 6.0 GB Free', style: TextStyle(fontSize: 12)),
                  ],
                ),
                subtitle: Container(
                  margin: EdgeInsets.only(top: 8),
                  color: Colors.grey,
                  height: 5,
                  width: 100,
                  alignment: Alignment.topLeft,
                  child: Container(height: 5, width: 210, color: psColorGreen).cornerRadiusWithClipRRect(50),
                ).cornerRadiusWithClipRRect(50),
                trailing: Icon(Icons.keyboard_arrow_right_sharp),
              ),
              Divider(thickness: 1),
              ListTile(
                visualDensity: VisualDensity(horizontal: -4, vertical: -4),
                onTap: () {
                  PSReviewsFragment().launch(context);
                },
                leading: Icon(Icons.stars, color: blackColor).paddingOnly(left: 8),
                title: Text('Review', style: boldTextStyle(size: 14)),
                trailing: Icon(Icons.keyboard_arrow_right_sharp),
              ),
              Divider(thickness: 1),
              Padding(
                padding: EdgeInsets.only(left: 16, top: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('On this device ($maxItemCount)', style: boldTextStyle(size: 18)),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 32),
                          child: Padding(
                            padding: EdgeInsets.only(left: 38),
                            child: Text('Alphabetical').onTap(() async {
                              await recentDialogBox(context);
                              setState(() {});
                            }),
                          ),
                        ),
                        8.width,
                        Icon(Icons.sort).onTap(() {
                          recentDialogBox(context);
                        }),
                      ],
                    ),
                  ],
                ),
              ),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: maxItemCount,
                itemBuilder: (context, index) {
                  PSMyAppsModel data = installList[index % installList.length];
                  return ListTile(
                    leading: commonCacheImageWidget(data.appLogo, fit: BoxFit.cover, height: 40, width: 40).cornerRadiusWithClipRRect(4),
                    title: Text(
                      data.title!,
                      style: secondaryTextStyle(),
                      overflow: TextOverflow.ellipsis,
                    ),
                    subtitle: Row(
                      children: [
                        Text(data.appSize!, style: secondaryTextStyle(size: 13)),
                        12.width,
                        Text(data.time!, style: secondaryTextStyle(size: 13)),
                      ],
                    ),
                    trailing: Container(
                      height: 28,
                      width: 80,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(3), border: Border.all(color: Colors.grey)),
                      child: FlatButton(child: Text('Open', style: TextStyle(color: psColorGreen)), onPressed: () {}),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
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
                height: 200,
                width: 200,
                //color: Colors.indigoAccent,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Sort By', style: boldTextStyle()).paddingOnly(left: 16, top: 16),
                    Row(
                      children: [
                        Radio(
                          activeColor: psColorGreen,
                          value: 1,
                          groupValue: group,
                          onChanged: (dynamic val) {
                            state(() {
                              installList.sort((a, b) => a.title!.toLowerCase().compareTo(b.title!.toLowerCase()));
                              group = val;
                              finish(context);
                              setState(() {});
                            });
                          },
                        ),
                        Text('Alphabetical', style: boldTextStyle())
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                          activeColor: psColorGreen,
                          value: 2,
                          groupValue: group,
                          onChanged: (dynamic val) {
                            state(() {
                              installList.sort((a, b) => a.time!.toLowerCase().compareTo(b.time!.toLowerCase()));
                              group = val;
                              finish(context);
                              setState(() {});
                            });
                          },
                        ),
                        Text('Last Updated', style: boldTextStyle())
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                          activeColor: psColorGreen,
                          value: 3,
                          groupValue: group,
                          onChanged: (dynamic val) {
                            state(() {
                              installList.sort((a, b) => a.appSize!.toLowerCase().compareTo(b.appSize!.toLowerCase()));
                              group = val;
                              finish(context);
                              setState(() {});
                            });
                          },
                        ),
                        Text('Size', style: boldTextStyle())
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
