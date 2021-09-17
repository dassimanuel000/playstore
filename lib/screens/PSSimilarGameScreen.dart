import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:playstore_flutter/model/PSModel.dart';
import 'package:playstore_flutter/utils/AppWidget.dart';
import 'package:playstore_flutter/utils/PSColor.dart';
import 'package:playstore_flutter/utils/PSDataProvider.dart';
import 'package:playstore_flutter/utils/PSImages.dart';
import 'package:playstore_flutter/utils/PSWidgets.dart';

class PSSimilarGameScreen extends StatefulWidget {
  @override
  _PSSimilarGameScreenState createState() => _PSSimilarGameScreenState();
}

class _PSSimilarGameScreenState extends State<PSSimilarGameScreen> {
  List<GameModelList> gameList = getGameListGame();
  List<GameModelList> gameList1 = getGameListGame1();
  List<GameModelList> gameList2 = getGameListGame2();
  List<GameModelList> gameList3 = getGameListGame3();

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {}

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: GMWhiteColor,
        leading: BackButton(
          color: GMBlackColor,
          onPressed: () {
            finish(context);
          },
        ),
        elevation: 1.0,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text('Similar games', style: boldTextStyle(size: 18)),
        actions: [IconButton(icon: Icon(Icons.search), onPressed: () {})],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              child: ListView.builder(
                itemCount: gameList.length,
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.only(left: 16, right: 8, top: 16, bottom: 8),
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  GameModelList data = gameList[index];
                  return Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 0, right: 8, top: 8, bottom: 8),
                        child: commonCacheImageWidget(data.img, width: 290, height: 190, fit: BoxFit.cover).cornerRadiusWithClipRRect(10),
                      ).cornerRadiusWithClipRRect(10),
                    ],
                  );
                },
              ),
            ),
            gameDetail(img: PS_GameImg1, txtPlayType: 'Call of Duty: Mobile', txtAction: 'Action . Shooter', txtRating: '4.5', txtSize: '1.7 GB'),
            8.height,
            getListView(gameList: gameList1),
            gameDetail(img: PS_GameImg2, txtPlayType: 'Cover Strike- 3D Team Shooter', txtAction: 'Action . Shooter . Casual . Offline', txtRating: '3.9', txtSize: '62 MB'),
            8.height,
            getListView(gameList: gameList2),
            gameDetail(img: PS_GameImg3, txtPlayType: 'Cover Hunter- 3v3 Team Battle', txtAction: 'Role Playing . Action . Shooter . Casual', txtRating: '4.0', txtSize: '1 GB'),
            8.height,
            getListView(gameList: gameList3),
            gameDetail(img: PS_GameImg4, txtPlayType: 'Hunter Assassin ', txtAction: 'Action . Offline . Single Player', txtRating: '4.2', txtSize: '41 MB'),
            8.height,
            getListView(gameList: gameList2),
            gameDetail(img: PS_GameImg5, txtPlayType: 'Hunter Assassin ', txtAction: 'Action . Offline . Single Player', txtRating: '4.2', txtSize: '41 MB'),
            8.height,
            getListView(gameList: gameList3),
            gameDetail(img: PS_GameImg6, txtPlayType: 'Cover Hunter- 3v3 Team Battle', txtAction: 'Role Playing . Action . Shooter . Casual', txtRating: '4.0', txtSize: '1 GB').paddingOnly(bottom: 16),
          ],
        ),
      ),
    );
  }
}
