import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:playstore_flutter/utils/PSConstants.dart';

class PSSettingScreen extends StatefulWidget {
  static String tag = '/PSSettingScreen';

  @override
  PSSettingScreenState createState() => PSSettingScreenState();
}

class PSSettingScreenState extends State<PSSettingScreen> {
  bool _value = false;

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
        // backgroundColor: Colors.white,
        //elevation: 0,
        title: Text('Settings', style: boldTextStyle()),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(title: Text('General')),
            buildListTile(title: "Notification", subTitle: "Manage notification setting", trailing: null).onTap(() {}),
            buildListTile(title: "App download preference", subTitle: "Over any network"),
            buildListTile(title: "Auto-update apps", subTitle: "Auto-update apps at any time. Data charge may apply."),
            buildListTile(title: "Auto-play videos", subTitle: "Auto-play videos over Wi-Fi only"),
            buildListTile(title: "Theme", subTitle: "System default"),
            buildListTile(title: "Clear local search history", subTitle: "Remove searches you have performed from this device"),
            buildListTile(title: "App preferences", subTitle: "Remove history in your have WishList, the Beta program, and other lists "),
            Divider(thickness: 2),
            Padding(padding: const EdgeInsets.only(left: 8), child: Text('User control', style: boldTextStyle())),
            buildListTile(title: "Parental", subTitle: "off"),
            SwitchListTile(
              title: Text("Biometric authentication"),
              subtitle: Text('For App purchases on this device'),
              value: _value,
              onChanged: (check) {
                setState(() {
                  _value = check;
                });
              },
            ),
            buildListTile(title: "Require authentication for purchases", subTitle: "For all purchases through App on this device"),
            buildListTile(title: "App Instant", subTitle: "Use apps and games without installation"),
            Divider(thickness: 2),
            Padding(padding: const EdgeInsets.only(left: 8), child: Text('About', style: boldTextStyle())),
            buildListTile(title: "Open Source licenses", subTitle: "License details for open source software"),
            buildListTile(title: "$PSAppName version", subTitle: "Version 1.0.0"),
            buildListTile(title: "App Protect certification", subTitle: "Device is certified"),
          ],
        ),
      ),
    );
  }

  Widget buildListTile({String title = "", String subTitle = "", Widget? trailing}) {
    return ListTile(
      onTap: () {},
      visualDensity: VisualDensity(horizontal: -4, vertical: -1),
      title: Text(title),
      subtitle: subTitle.isEmpty ? null : Text(subTitle),
      trailing: trailing,
    );
  }
}
