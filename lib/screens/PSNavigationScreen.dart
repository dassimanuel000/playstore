import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:playstore_flutter/utils/PSImages.dart';

class AppScreen extends StatefulWidget {
  static String tag = '/AppScreen';

  @override
  AppScreenState createState() => AppScreenState();
}

class AppScreenState extends State<AppScreen> {
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
    return Container(
      padding: EdgeInsets.only(right: 8),
      alignment: Alignment.topCenter,
      decoration: BoxDecoration(color: Colors.white, boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 2.0)], borderRadius: BorderRadius.circular(8)),
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(top: 50, left: 16, right: 16),
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
          8.width,
          TextFormField(
            showCursor: false,
            decoration: InputDecoration(focusedBorder: InputBorder.none, enabledBorder: InputBorder.none, errorBorder: InputBorder.none, hintText: 'Search for apps & games'),
          ).expand(),
          8.width,
          IconButton(
            icon: Icon(Icons.keyboard_voice_outlined),
            onPressed: () {},
          ),
          InkWell(
            onTap: () {
              accountDialogBox(context);
            },
            child: CircleAvatar(maxRadius: 17, child: Text('J'), backgroundColor: Colors.purple),
          ),
        ],
      ),
    );
  }

  Future accountDialogBox(BuildContext context) async {
    return await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          scrollable: true,
          contentPadding: EdgeInsets.zero,
          content: Container(
            height: 440,
            width: 400,
            child: Column(
              children: [
                Container(
                  width: 400,
                  child: Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.close),
                        onPressed: () {
                          finish(context);
                        },
                      ),
                      Image.asset(PS_google, width: 30, height: 30).paddingOnly(right: 26).expand(),
                    ],
                  ),
                ),
                ListTile(
                  title: Text('John Doe'),
                  subtitle: Text('johndoe@gmail.com'),
                  leading: CircleAvatar(
                    backgroundColor: Colors.green,
                    child: Text('S', style: TextStyle(color: Colors.white)),
                  ),
                ),
                FlatButton(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16), side: BorderSide(color: Colors.black26)),
                  onPressed: () {},
                  child: Text('My Account'),
                ),
                Divider(thickness: 1),
                ListTile(
                  onTap: () {},
                  title: Text('Smith Doe'),
                  subtitle: Text('smith.doe@gmail.com'),
                  leading: CircleAvatar(
                    backgroundColor: Colors.green,
                    child: Text('S', style: TextStyle(color: Colors.white)),
                  ),
                ),
                ListTile(
                  onTap: () {},
                  leading: CircleAvatar(child: Icon(Icons.person_add_alt_1_outlined, color: Colors.black54)),
                  title: Text('Add another account'),
                ),
                ListTile(
                  onTap: () {},
                  leading: CircleAvatar(
                    child: Icon(Icons.person_add_alt_1_outlined, color: Colors.black54),
                  ),
                  title: Text('Manage account on this device'),
                ),
                Divider(thickness: 1),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FlatButton(onPressed: () {}, child: Text('Privacy Policy', style: TextStyle(fontSize: 12))),
                    FlatButton(onPressed: () {}, child: Text('Terms of Service', style: TextStyle(fontSize: 12))),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
