import 'package:flutter/cupertino.dart';

import 'package:consumerteamui/components/icon_button.dart';

class Head extends StatefulWidget {
  Head({Key? key}) : super(key: key);

  @override
  _HeadState createState() => _HeadState();
}

class _HeadState extends State<Head> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: GridView.count(
          //水平子Widget之间间距
          crossAxisSpacing: 10.0,
          //垂直子Widget之间间距
          mainAxisSpacing: 5.0,
          //GridView内边距
          padding: EdgeInsets.all(10.0),
          //一行的Widget数量
          crossAxisCount: 4,
          //子Widget列表
          children: <Widget>[
            IconButton(
              Txt: "提货通知",
              IconData: IconData(0xe61b, fontFamily: 'Albb'),
              goUrl: "TakePage",
            ),
            IconButton(
              Txt: "待收货订单",
              IconData: IconData(0xe637, fontFamily: 'Albb'),
              goUrl: "ReceivingPage",
            ),
            IconButton(
              Txt: "待发货订单",
              IconData: IconData(0xe633, fontFamily: 'Albb'),
              goUrl: "SendoutPage",
            ),
            IconButton(
              Txt: "待支付订单",
              IconData: IconData(0xe617, fontFamily: 'Albb'),
              goUrl: "PaidPage",
            ),
          ]),
    );
  }
}
