import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './orders/orders.dart';
import 'package:consumerteamui/components/loop_notice.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 0, left: 4, right: 4, bottom: 8),
      child: Column(children: <Widget>[
        LoopNotice(
          tip: '号外，号外，温州皮革厂倒闭了，黄鹤跟他小姨子跑路了',
          textStyle: TextStyle(fontSize: 14.0),
        ),
        Orders(),
      ]),
    );
  }
}
