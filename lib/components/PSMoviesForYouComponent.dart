import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:playstore_flutter/model/PSAppbarModel.dart';
import 'package:playstore_flutter/model/PSModel.dart';
import 'package:playstore_flutter/screens/PSBooKDetailsScreen.dart';
import 'package:playstore_flutter/utils/AppWidget.dart';

class PSMoviesForYouComponent extends StatelessWidget {
  final PSGameModel data;
  final List<PSAppbarModel>? list;

  PSMoviesForYouComponent(this.data, this.list);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      child: GestureDetector(
        onTap: () {
          PSBookDetailsScreen(data: data, list: list).launch(context);
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            commonCacheImageWidget(data.imgMain, height: 150, width: 100, fit: BoxFit.cover).cornerRadiusWithClipRRect(5),
            8.height,
            Text(data.title!, style: boldTextStyle(size: 12), overflow: TextOverflow.ellipsis, maxLines: 1),
            Row(
              children: [
                Text(data.rating.toString(), style: secondaryTextStyle()),
                4.width,
                Icon(Icons.star, size: 10),
                8.width,
                Text("₹" + data.appSize.toString(), style: secondaryTextStyle(size: 12)),
              ],
            ),
          ],
        ).paddingOnly(left: 8, right: 8),
      ),
    );
  }
}
