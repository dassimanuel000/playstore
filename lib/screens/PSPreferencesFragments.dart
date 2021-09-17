import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:playstore_flutter/utils/PSColor.dart';
import 'package:playstore_flutter/utils/PSConstants.dart';

class PSPreferencesFragment extends StatefulWidget {
  static String tag = '/PSPreferencesFragment';

  @override
  PSPreferencesFragmentState createState() => PSPreferencesFragmentState();
}

class PSPreferencesFragmentState extends State<PSPreferencesFragment> {
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(title: Text('Email preferences')),
            SwitchListTile(
              title: Text('Emails from App'),
              subtitle: Text('Receive emails with news and offers from App'),
              value: _value,
              onChanged: (check) {
                setState(() {
                  _value = check;
                });
              },
            ),
            ListTile(title: Text('Smith.bhavsar@gmail.com'), subtitle: Text('Change contact email')),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 12),
              child: RichText(
                text: TextSpan(
                  text: 'The address where you get information about most of the Google product you use with this account.',
                  style: DefaultTextStyle.of(context).style,
                  children: [
                    TextSpan(text: "More options", style: TextStyle(color: psColorGreen, decoration: TextDecoration.underline)),
                  ],
                ),
              ),
            ),
            Divider(thickness: 2),
            ListTile(title: Text('Country and profiles')),
            ListTile(title: Text('Switch to the India $PSAppName')),
            ListTile(title: Text('Add Netbanking'), leading: Icon(Icons.house_rounded)),
            ListTile(title: Text('Add credit or debit card'), leading: Icon(Icons.credit_card_rounded)),
            ListTile(title: Text('Use Vi billing'), leading: Icon(Icons.wifi)),
            ListTile(title: Text('Add bank account With BHIM UPI ID '), leading: Icon(Icons.account_balance_wallet)),
            8.height,
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: RichText(
                text: TextSpan(
                  text: "You should change your play country only when you move to a new country.",
                  style: DefaultTextStyle.of(context).style,
                  children: [TextSpan(text: "Learn more", style: TextStyle(color: psColorGreen, decoration: TextDecoration.underline))],
                ),
              ),
            ),
            12.height,
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: RichText(
                text: TextSpan(
                  text: "You may see content relevant to your general location, base on your Internet address.",
                  style: DefaultTextStyle.of(context).style,
                  children: [
                    TextSpan(text: "Learn more", style: TextStyle(color: psColorGreen, decoration: TextDecoration.underline)),
                  ],
                ),
              ),
            ),
            32.height,
          ],
        ),
      ),
    );
  }
}
