import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:playstore_flutter/utils/PSImages.dart';

class PSPaymentScreen extends StatefulWidget {
  static String tag = '/PSPaymentScreen';

  @override
  PSPaymentScreenState createState() => PSPaymentScreenState();
}

class PSPaymentScreenState extends State<PSPaymentScreen> {
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
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text('Payment methods', style: boldTextStyle()),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(padding: const EdgeInsets.only(top: 32), child: Image.asset(PS_Pubg, width: 100, height: 150)),
            18.height,
            Text('Make your next purchase fast and easy by\nadding a payment method now!', textAlign: TextAlign.center),
            22.height,
            Divider(thickness: 1),
            16.height,
            ListTile(title: Text('Add payment method')),
            ListTile(title: Text('Use Vi billing'), leading: Icon(Icons.wifi)),
            ListTile(title: Text('Add credit or debit card'), leading: Icon(Icons.credit_card_outlined)),
            ListTile(title: Text('Add bank account with BHIM UPI ID'), leading: Icon(Icons.credit_card)),
            ListTile(title: Text('Add NetBanking'), leading: Icon(Icons.house_rounded)),
            ListTile(title: Text('Redeem code'), leading: Icon(Icons.credit_card_sharp)),
            Divider(thickness: 1),
            ListTile(title: Text('More options')),
            ListTile(title: Text('More payment setting'), leading: Icon(Icons.settings)),
            8.height,
          ],
        ).paddingOnly(left: 12),
      ),
    );
  }
}
