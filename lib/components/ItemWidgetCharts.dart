import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:playstore_flutter/model/PSModel.dart';
import 'package:playstore_flutter/utils/AppWidget.dart';

// ignore: must_be_immutable
class ItemWidgetCharts extends StatelessWidget {
  static String tag = '/ItemWidgetCharts';

  int number = 1;
  final PSGameModel data;

  ItemWidgetCharts(this.data);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        16.height,
        Row(
          children: [
            8.width,
            commonCacheImageWidget(data.imgLogo, height: 50, width: 60, fit: BoxFit.cover).cornerRadiusWithClipRRect(10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(data.title!, style: boldTextStyle()).paddingOnly(left: 16),
                Text(data.subTitle!, style: secondaryTextStyle()).paddingOnly(left: 16),
                Row(
                  children: [
                    Text(data.rating.toString(), style: secondaryTextStyle()).paddingOnly(left: 16),
                    Icon(Icons.star, size: 10),
                    Text(data.appSize.toString()).paddingOnly(left: 16),
                  ],
                )
              ],
            ),
          ],
        )
      ],
    ).paddingOnly(left: 16);
  }
}
