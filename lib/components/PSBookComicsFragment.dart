import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:playstore_flutter/model/PSModel.dart';
import 'package:playstore_flutter/screens/PSBooKDetailsScreen.dart';
import 'package:playstore_flutter/utils/AppWidget.dart';

class PSBookComicsFragment extends StatelessWidget {
  final PSGameModel data4;

  PSBookComicsFragment(this.data4);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      child: GestureDetector(
        onTap: () {
          PSBookDetailsScreen(data: data4).launch(context);
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            commonCacheImageWidget(data4.imgMain, height: 150, width: 100, fit: BoxFit.cover).cornerRadiusWithClipRRect(5),
            4.height,
            Text(data4.title!, style: boldTextStyle(size: 12), overflow: TextOverflow.ellipsis, maxLines: 1),
            Row(
              children: [
                Text(data4.rating.toString(), style: secondaryTextStyle()),
                4.width,
                Icon(Icons.star, size: 10),
                8.width,
                Text("₹" + data4.appSize.toString(), style: secondaryTextStyle(size: 12)),
              ],
            ),
          ],
        ).paddingOnly(left: 8, right: 8),
      ),
    );
  }
}
