import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:playstore_flutter/model/PSModel.dart';
import 'package:playstore_flutter/screens/PSDetailScreen.dart';
import 'package:playstore_flutter/utils/AppWidget.dart';

class PSGpremiumFragment extends StatelessWidget {
  final PSGameModel data;

  PSGpremiumFragment(this.data);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(left: 8, right: 8),
          width: 220,
          child: Column(
            children: [
              commonCacheImageWidget(data.imgMain, height: 110, width: 220, fit: BoxFit.cover).cornerRadiusWithClipRRect(10).onTap(() {
                PSDetailScreen(data: data).launch(context);
              }),
              8.height,
              Row(
                children: [
                  commonCacheImageWidget(data.imgLogo, height: 45, width: 45, fit: BoxFit.cover).cornerRadiusWithClipRRect(10),
                  8.width,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data.title!,
                        style: primaryTextStyle(size: 14),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                      Row(
                        children: [
                          Text(data.subTitle!, style: primaryTextStyle(size: 12), overflow: TextOverflow.ellipsis),
                        ],
                      ),
                      Row(
                        children: [
                          Row(
                            children: [
                              Text(data.rating.toString(), style: primaryTextStyle(size: 12)),
                              Icon(Icons.star, size: 12),
                            ],
                          ),
                          8.width,
                          Text(data.appSize.toString() + "MB", style: primaryTextStyle(size: 12)),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
