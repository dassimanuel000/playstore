import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:playstore_flutter/utils/AppWidget.dart';
import 'package:playstore_flutter/utils/PSColor.dart';

class PSPlayProtectScreen extends StatefulWidget {
  static String tag = '/PSPlayProtectScreen';

  @override
  PSPlayProtectScreenState createState() => PSPlayProtectScreenState();
}

class PSPlayProtectScreenState extends State<PSPlayProtectScreen> {
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
        actions: [
          Icon(Icons.settings_rounded, color: Colors.black87).paddingOnly(bottom: 8, right: 8),
        ],
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text('Play Protect', style: boldTextStyle()),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.center,
              child: Column(
                children: [
                  Icon(Icons.privacy_tip_outlined, color: Colors.green, size: 70).paddingOnly(top: 38),
                  38.height,
                  Text('No problems Founds', style: boldTextStyle()),
                  4.height,
                  Text('Play Protect Scanned yesterday at 5:38 PM', style: secondaryTextStyle(), textAlign: TextAlign.center),
                  16.height,
                  InkWell(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(3), border: Border.all(color: Colors.grey[400]!)),
                      height: 30,
                      width: 100,
                      child: Center(child: Text('Scan', style: boldTextStyle(color: psColorGreen))),
                    ),
                  )
                ],
              ),
            ),
            32.height,
            Text('Recently Scanned apps', style: boldTextStyle(size: 18)).paddingOnly(left: 8),
            16.height,
            Row(
              children: [
                commonCacheImageWidget('https://picsum.photos/250?image=9', width: 40, height: 40, fit: BoxFit.cover).cornerRadiusWithClipRRect(5).paddingOnly(left: 8),
                8.width,
                commonCacheImageWidget('https://picsum.photos/250?image=9', width: 40, height: 40, fit: BoxFit.cover).cornerRadiusWithClipRRect(5),
                8.width,
                commonCacheImageWidget('https://picsum.photos/250?image=9', width: 40, height: 40, fit: BoxFit.cover).cornerRadiusWithClipRRect(5),
                8.width,
                commonCacheImageWidget('https://picsum.photos/250?image=9', width: 40, height: 40, fit: BoxFit.cover).cornerRadiusWithClipRRect(5),
                8.width,
                commonCacheImageWidget('https://picsum.photos/250?image=9', width: 40, height: 40, fit: BoxFit.cover).cornerRadiusWithClipRRect(5),
                8.width,
                Column(
                  children: [
                    Text('+96', style: secondaryTextStyle()),
                    Text('more', style: secondaryTextStyle()),
                  ],
                )
              ],
            ),
            32.height,
            Text('Apps Scanned yesterday at 3:17 PM', style: secondaryTextStyle()).paddingOnly(left: 8),
            16.height,
            Divider(thickness: 1, indent: 10, endIndent: 20),
            16.height,
            Text('Play Protect regularly checks your apps and device for harmful behavior. You\'ll be notified of any security risks found.', style: secondaryTextStyle()).paddingOnly(left: 8),
            32.height,
            Text('Learn more', style: boldTextStyle(color: psColorGreen)).paddingOnly(left: 8)
          ],
        ),
      ).paddingOnly(left: 12, right: 12),
    );
  }
}
