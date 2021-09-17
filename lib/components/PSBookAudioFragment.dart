import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:playstore_flutter/model/PSModel.dart';
import 'package:playstore_flutter/screens/PSBooKDetailsScreen.dart';
import 'package:playstore_flutter/utils/AppWidget.dart';

class PSBookAudioFragment extends StatelessWidget {
  final PSGameModel data;

  PSBookAudioFragment(this.data);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          commonCacheImageWidget(data.imgMain, height: 140, width: 160, fit: BoxFit.cover).cornerRadiusWithClipRRect(5).onTap(() {
            PSBookDetailsScreen(data: data).launch(context);
          }),
          8.height,
          Text(data.title!, style: boldTextStyle(size: 11), overflow: TextOverflow.ellipsis, maxLines: 1),
          Text("₹" + data.appSize.toString(), style: secondaryTextStyle(size: 12)),
        ],
      ).paddingOnly(left: 8, right: 8),
    );
  }
}
