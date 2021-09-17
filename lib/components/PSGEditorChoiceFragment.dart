import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:playstore_flutter/model/PSAppbarModel.dart';
import 'package:playstore_flutter/utils/AppWidget.dart';

class PSGEditorChoiceFragment extends StatefulWidget {
  static String tag = '/GEditorChoice';

  final int tabIndex;

  PSGEditorChoiceFragment(this.tabIndex);

  @override
  PSGEditorChoiceFragmentState createState() => PSGEditorChoiceFragmentState();
}

class PSGEditorChoiceFragmentState extends State<PSGEditorChoiceFragment> {
  List<PSAppbarModel> data1 = getGameList;
  var EditorsList = getGameList[5].list;

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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Editors' Choice Apps", style: boldTextStyle()).paddingOnly(left: 16, top: 12),
        16.height,
        ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: EditorsList!.length,
          itemBuilder: (context, index) {
            return Row(
              children: [
                commonCacheImageWidget(EditorsList![index].imgMain, fit: BoxFit.cover, height: 90, width: 150).cornerRadiusWithClipRRect(10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(EditorsList![index].title!, overflow: TextOverflow.ellipsis, maxLines: 2, style: primaryTextStyle()).paddingOnly(left: 8),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: EditorsList![index].imagesData!.map(
                          (e) {
                            return commonCacheImageWidget(e, height: 30, width: 30, fit: BoxFit.cover);
                          },
                        ).toList()),
                  ],
                ).paddingOnly(left: 8).expand()
              ],
            ).paddingOnly(left: 16, bottom: 24);
          },
        )
      ],
    );
  }
}
