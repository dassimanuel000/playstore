import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:playstore_flutter/model/PSModel.dart';
import 'package:playstore_flutter/utils/AppWidget.dart';
import 'package:playstore_flutter/utils/PSColor.dart';
import 'package:playstore_flutter/utils/PSDataProvider.dart';

class PSFlagPropertiesScreen extends StatefulWidget {
  static String tag = '/PSFlagPropertiesScreen';

  final PSGameModel? data7;

  PSFlagPropertiesScreen({this.data7});

  @override
  PSFlagPropertiesScreenState createState() => PSFlagPropertiesScreenState();
}

class PSFlagPropertiesScreenState extends State<PSFlagPropertiesScreen> {
  List<PSRadio> listRadio = getRadioList();

  int? checkGroupValue = null;
  bool enable = false;
  bool isCheck = false;

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
      bottomNavigationBar: BottomAppBar(
        child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
          FlatButton(
            onPressed: () {
              setState(() {
                finish(context);
              });
            },
            child: Text('CANCEL', style: boldTextStyle(size: 14, color: psColorGreen)),
          ),
          FlatButton(disabledColor: Colors.grey, onPressed: () {}, child: Text('SUBMIT', style: boldTextStyle(size: 14, color: enable ? Colors.green : Colors.grey)))
        ]),
      ),
      appBar: AppBar(
        leading: Icon(Icons.close).onTap(() {
          finish(context);
        }),
        title: Text('Flag as inappropriate', style: boldTextStyle()),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                commonCacheImageWidget(widget.data7!.imgLogo, height: 60, width: 60, fit: BoxFit.cover).cornerRadiusWithClipRRect(10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.data7!.title!, style: boldTextStyle(), overflow: TextOverflow.ellipsis, maxLines: 2).paddingOnly(left: 8, top: 8),
                    if (widget.data7!.subTitle1 != null) Text(widget.data7!.subTitle1!, style: secondaryTextStyle(color: psColorGreen)).paddingOnly(left: 8),
                  ],
                ).expand(),
              ],
            ).paddingOnly(left: 8, top: 8),
            16.height,
            Divider(thickness: 1),
            Text("The reason you find this content or app objectionable:", style: primaryTextStyle(size: 18)).paddingLeft(16),
            Container(
              height: 430,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: listRadio.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      setState(() {
                        enable = true;
                        checkGroupValue = index;
                      });
                    },
                    child: Row(children: [
                      Radio(
                        activeColor: psColorGreen,
                        value: index,
                        groupValue: checkGroupValue,
                        onChanged: (dynamic val) {
                          setState(() {
                            enable = true;
                            checkGroupValue = index;
                          });
                        },
                      ),
                      Text(listRadio[index].title!, style: primaryTextStyle())
                    ]).paddingOnly(top: 8),
                  );
                },
              ).paddingOnly(top: 16),
            ),
          ],
        ),
      ),
    );
  }
}
