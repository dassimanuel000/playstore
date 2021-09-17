import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:playstore_flutter/model/PSAppbarModel.dart';
import 'package:playstore_flutter/screens/PSBooKDetailsScreen.dart';
import 'package:playstore_flutter/utils/AppWidget.dart';

class PSMTopSellingFragment extends StatefulWidget {
  static String tag = '/MTopSelling';

  PSMTopSellingFragment(int tabIndex);

  @override
  PSMTopSellingFragmentState createState() => PSMTopSellingFragmentState();
}

class PSMTopSellingFragmentState extends State<PSMTopSellingFragment> {
  List<PSAppbarModel> data = movieList;
  var sellingList = movieList[1].list;
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
      itemCount: sellingList!.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            Row(
              children: [
                8.width,
                commonCacheImageWidget(sellingList![index].imgMain, fit: BoxFit.cover, width: 60, height: 80).cornerRadiusWithClipRRect(10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(sellingList![index].title!, style: secondaryTextStyle()),
                    Text(sellingList![index].subTitle!, style: secondaryTextStyle()),
                    Text(sellingList![index].rating.toString(), style: secondaryTextStyle()),
                    Text("₹" + sellingList![index].appSize.toString(), style: secondaryTextStyle()),
                  ],
                ).paddingOnly(left: 16)
              ],
            ).paddingOnly(bottom: 8),
          ],
        ).onTap(() {
          PSBookDetailsScreen(data: sellingList![index]).launch(context);
        }).paddingOnly(left: 16, top: 16);
      },
    );
  }
}
