import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:playstore_flutter/model/PSModel.dart';
import 'package:playstore_flutter/utils/AppWidget.dart';
import 'package:playstore_flutter/utils/PSColor.dart';

class PSAboutGameScreen extends StatefulWidget {
  static String tag = '/PSAboutGameScreen';
  final PSGameModel? data;

  PSAboutGameScreen({this.data});

  @override
  PSAboutGameScreenState createState() => PSAboutGameScreenState();
}

class PSAboutGameScreenState extends State<PSAboutGameScreen> {
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
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            commonCacheImageWidget(widget.data!.imgLogo != null ? widget.data!.imgLogo : widget.data!.imgMain, height: 40, width: 40, fit: BoxFit.cover).paddingOnly(right: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.data!.title!, style: boldTextStyle(), overflow: TextOverflow.ellipsis),
                Text('Details', style: boldTextStyle()),
              ],
            ).expand(),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('About this games', style: boldTextStyle()),
            8.height,
            Text('Swipe and place the tiles orderly. Challenge the number maze quicKly.', style: secondaryTextStyle()),
            16.height,
            createRichText(
              list: [
                TextSpan(text: 'NumPuz: Number Riddle is a classic math puzzle game.', style: boldTextStyle(size: 14)),
                TextSpan(
                  text: 'Tap and move  the Wood number tiles,enjoy the magic of digit, coordinate your eyes,hands and brain. Challenge your logic and brainPower, have fun and enjoy it!',
                  style: secondaryTextStyle(size: 14),
                ),
              ],
              overflow: TextOverflow.visible,
            ),
            16.height,
            Text('How to play NumPuz?', style: boldTextStyle(size: 14)),
            8.height,
            Text(
              'Sliding puzzle game Consists of a frame of number square tiles random order,with one title missing,The object of the puzzle is to place the tiles in order by making sliding moves that use the empty space. Endless challenge mode that challenges your logic thinking and limits',
              style: secondaryTextStyle(),
            ),
            16.height,
            Text('FEATURES:', style: boldTextStyle()),
            8.height,
            Text('-6 levels of difficulty (3,4,5,6,7,8 modes)', style: secondaryTextStyle()),
            Text('-Wooden retro style of user interface ', style: secondaryTextStyle()),
            Text('-Simple to Control, hard to master', style: secondaryTextStyle()),
            Text('-Wooden retro style of user interface ', style: secondaryTextStyle()),
            Text('-Simple to Control, hard to master', style: secondaryTextStyle()),
            Text('-Wooden retro style of user interface ', style: secondaryTextStyle()),
            Text('-Simple to Control, hard to master', style: secondaryTextStyle()),
            Text('-Wooden retro style of user interface ', style: secondaryTextStyle()),
            Text('-Simple to Control, hard to master', style: secondaryTextStyle()),
            16.height,
            Text('6 different Size', style: boldTextStyle()),
            8.height,
            Text('3 X 3 (8 tiles) - for number puzzle beginners.', style: secondaryTextStyle()),
            Text('4 X 4 (15 tiles) - classical slide puzzle mode.', style: secondaryTextStyle()),
            Text('5 X 5 (24 tiles) - for those who like to think.', style: secondaryTextStyle()),
            Text('6 X 6 (35 tiles) - complex mode to challenge.', style: secondaryTextStyle()),
            Text('7 X 7 (48 tiles) - difficult level to challenge.', style: secondaryTextStyle()),
            Text('8 X 8 (48 tiles) - design for master players.', style: secondaryTextStyle()),
            16.height,
            Text(
              'Sliding puzzle game Consists of a frame of number square tiles random order,with one title missing,The object of the puzzle is to place the tiles in order by making sliding moves that use the empty space. Endless challenge mode that challenges your logic thinking and limits.',
              style: secondaryTextStyle(),
            ),
            16.height,
            Divider(thickness: 1),
            16.height,
            Row(
              children: [
                Text('What\'s new', style: boldTextStyle()),
                16.width,
                CircleAvatar(maxRadius: 5, minRadius: 5, backgroundColor: psColorGreen),
              ],
            ),
            16.height,
            Text('Optimal product experience and fix some problems.', style: secondaryTextStyle()).paddingOnly(right: 32),
            Text('Tap and move  the Wood number tiles,enjoy the magic of digit, coordinate your eyes,hands and brain. Challenge your logic and brainPower, have fun and enjoy it!', style: secondaryTextStyle()),
            16.height,
            Divider(thickness: 1),
            8.height,
            Text('More info', style: boldTextStyle()),
            16.height,
            Row(
              children: [
                Icon(Icons.move_to_inbox_rounded, size: 40),
                16.width,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Rated for 3+', style: boldTextStyle()),
                    Text('Learn more', style: secondaryTextStyle(color: psColorGreen)),
                  ],
                )
              ],
            ),
            16.height,
            Row(
              children: [
                Icon(Icons.four_k_sharp, size: 40),
                16.width,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Contains ads', style: secondaryTextStyle()),
                    Text('Ads are placed by the app developer', style: secondaryTextStyle()),
                    Text('Learn more', style: secondaryTextStyle(color: psColorGreen)),
                  ],
                )
              ],
            ),
            16.height,
            Divider(thickness: 1),
            Text('Game info', style: boldTextStyle()),
            16.height,
            Row(
              children: [Text('Version', style: secondaryTextStyle()).expand(), Text('4.5501', style: secondaryTextStyle())],
            ),
            32.height,
            Row(
              children: [Text('Updated on', style: secondaryTextStyle()).expand(), Text('Nov 20,2020', style: secondaryTextStyle())],
            ),
            32.height,
            Row(
              children: [Text('Download size', style: secondaryTextStyle()).expand(), Text('50,000,000+downloads', style: secondaryTextStyle())],
            ),
            32.height,
            Row(
              children: [Text('Download Size', style: secondaryTextStyle()).expand(), Text('66.09 MB', style: secondaryTextStyle())],
            ),
            32.height,
            Row(
              children: [Text('In-app purchases', style: secondaryTextStyle()).expand(), Text('249.00 per items', style: secondaryTextStyle())],
            ),
            32.height,
            Row(
              children: [Text('Offered by', style: secondaryTextStyle()).expand(), Text('DoPuz Games', style: secondaryTextStyle())],
            ),
            32.height,
            Row(
              children: [Text('Released On', style: secondaryTextStyle()).expand(), Text('Feb 26, 2018', style: secondaryTextStyle())],
            ),
            32.height,
            Row(
              children: [Text('App permissions', style: secondaryTextStyle()).expand(), Text('See More', style: secondaryTextStyle(color: psColorGreen))],
            ),
            32.height,
          ],
        ),
      ).paddingOnly(left: 16, top: 16, right: 16),
    );
  }
}
