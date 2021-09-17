import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:playstore_flutter/model/PSAppbarModel.dart';
import 'package:playstore_flutter/screens/PSBooKDetailsScreen.dart';
import 'package:playstore_flutter/utils/AppWidget.dart';

class PSMReleaseFragment extends StatefulWidget {
  static String tag = '/MnewReleases';

  PSMReleaseFragment(int tabIndex);

  @override
  PSMReleaseFragmentState createState() => PSMReleaseFragmentState();
}

class PSMReleaseFragmentState extends State<PSMReleaseFragment> {
  List<PSAppbarModel> data = movieList;
  var releaseList = movieList[2].list;
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
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: releaseList!.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            PSBookDetailsScreen(data: releaseList![index]).launch(context);
          },
          child: Column(
            children: [
              Row(
                children: [
                  8.width,
                  commonCacheImageWidget(releaseList![index].imgMain, fit: BoxFit.cover, width: 60, height: 80).cornerRadiusWithClipRRect(10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(releaseList![index].title!, style: secondaryTextStyle()),
                      Text(releaseList![index].subTitle!, style: secondaryTextStyle()),
                      Text(releaseList![index].rating.toString(), style: secondaryTextStyle()),
                      Text("₹" + releaseList![index].appSize.toString(), style: secondaryTextStyle()),
                    ],
                  ).paddingOnly(left: 16)
                ],
              ).paddingOnly(bottom: 8),
            ],
          ).paddingOnly(left: 16, top: 16),
        );
      },
    );
  }
}
