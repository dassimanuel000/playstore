import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:playstore_flutter/utils/PSColor.dart';

Future accountDialogBox(BuildContext context, {Function? onPressed}) async {
  return await showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        contentPadding: EdgeInsets.zero,
        content: Container(
          height: 200,
          width: 400,
          child: Column(
            children: [
              Row(
                children: [
                  Icon(Icons.all_inbox).paddingOnly(top: 16, right: 16, left: 16),
                  Text('Rated for 3+', style: boldTextStyle()).paddingOnly(top: 16),
                ],
              ),
              Text('Suitable for all age groups. Some violence in Comical or fantasy context is acceptable Bad language is not permitted.', style: secondaryTextStyle()).paddingOnly(left: 16, top: 8, right: 8),
              16.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FlatButton(minWidth: 10, height: 10, onPressed: () {}, child: Text('Learn more', style: primaryTextStyle(color: psColorGreen))),
                  FlatButton(
                    minWidth: 10,
                    height: 10,
                    onPressed: () {
                      onPressed!().call();
                    },
                    child: Text('Got it', style: primaryTextStyle(color: psColorGreen)),
                  )
                ],
              )
            ],
          ),
        ),
      );
    },
  );
}
