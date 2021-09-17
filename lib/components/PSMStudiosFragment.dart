import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:playstore_flutter/model/PSModel.dart';
import 'package:playstore_flutter/screens/PSBooKDetailsScreen.dart';
import 'package:playstore_flutter/utils/AppWidget.dart';

class PSMStudiosFragment extends StatelessWidget {
  final PSGameModel data;

  PSMStudiosFragment(this.data);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        commonCacheImageWidget(data.imgMain, height: 150, width: 100, fit: BoxFit.cover).cornerRadiusWithClipRRect(5),
        8.height,
        Text(data.title!, style: boldTextStyle(size: 12), overflow: TextOverflow.ellipsis, maxLines: 1),
        Row(
          children: [
            Text(data.rating.toString(), style: secondaryTextStyle()),
            4.width,
            Icon(Icons.star, size: 14),
            8.width,
            Text("₹" + data.appSize.toString(), style: secondaryTextStyle(size: 12)),
          ],
        ),
      ]).paddingOnly(left: 8, right: 8).onTap(() {
        PSBookDetailsScreen(data: data).launch(context);
      }),
    );
  }
}
