import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:playstore_flutter/model/PSModel.dart';
import 'package:playstore_flutter/utils/AppWidget.dart';
import 'package:playstore_flutter/utils/PSColor.dart';
import 'package:playstore_flutter/utils/PSConstants.dart';
import 'package:playstore_flutter/utils/PSDataProvider.dart';

class PSUreViewedFragment extends StatefulWidget {
  static String tag = '/PSUnreViewedFragment';

  @override
  PSUreViewedFragmentState createState() => PSUreViewedFragmentState();
}

class PSUreViewedFragmentState extends State<PSUreViewedFragment> {
  List<PSGameModel> reViewList = getDiscoverList();

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
      body: ListView.builder(
        itemCount: maxItemCount,
        itemBuilder: (context, index) {
          PSGameModel data = reViewList[index % reViewList.length];

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  commonCacheImageWidget(data.imgLogo, fit: BoxFit.cover, height: 40, width: 40).cornerRadiusWithClipRRect(4).paddingOnly(top: 28, right: 20, left: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(data.title!, overflow: TextOverflow.ellipsis).paddingOnly(top: 18),
                      Text(data.subTitle!, overflow: TextOverflow.ellipsis),
                    ],
                  )
                ],
              ),
              16.height,
              RatingBarWidget(
                itemCount: 5,
                size: 28,
                spacing: 16,
                rating: 0,
                onRatingChanged: (v) {},
              ),
              16.height,
              Text('Write a review', style: TextStyle(color: psColorGreen)).paddingOnly(left: 20),
            ],
          );
        },
      ),
    );
  }
}
