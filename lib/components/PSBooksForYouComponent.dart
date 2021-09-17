import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:playstore_flutter/model/PSAppbarModel.dart';
import 'package:playstore_flutter/model/PSModel.dart';
import 'package:playstore_flutter/screens/PSBooKDetailsScreen.dart';
import 'package:playstore_flutter/utils/AppWidget.dart';

class PSBooksForYouComponent extends StatelessWidget {
  final PSGameModel? data;
  final List<PSAppbarModel>? list;

  PSBooksForYouComponent({this.data, this.list});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      child: GestureDetector(
        onTap: () {
          PSBookDetailsScreen(data: data, list: list).launch(context);
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            commonCacheImageWidget(data!.imgMain, height: 150, width: 140, fit: BoxFit.cover).cornerRadiusWithClipRRect(5),
            4.height,
            Text(data!.title!, style: boldTextStyle(size: 12), overflow: TextOverflow.ellipsis, maxLines: 1),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(data!.rating.toString(), style: secondaryTextStyle()),
                4.width,
                Icon(Icons.star, size: 10),
                8.width,
                Text("₹" + data!.appSize.toString(), style: secondaryTextStyle(size: 12)),
              ],
            )
          ],
        ).paddingOnly(left: 8, right: 8),
      ),
    );
  }
}
