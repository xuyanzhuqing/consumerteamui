import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './orders/orders.dart';
import './orders/head.dart';
import './orders/sort.dart';
import 'package:consumerteamui/components/loop_notice.dart';

class Homepage extends StatefulWidget {
  final bool isHead;
  Homepage({
    Key? key,
    this.isHead = false,
  }) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  get isHead => null;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      // SingleChildScrollView  垂直方向空间会超过屏幕视口高度.滚动
      // padding: const EdgeInsets.only(top: 0, left: 4, right: 4, bottom: 8),
      child: Column(children: <Widget>[
        LoopNotice(
          tip: '通知消233息通22222知消息通知消息通知消息',
          textStyle: TextStyle(fontSize: 14.0),
        ),
        Orders(),
        // Head(),
        Sort(),
      ]),
    );
  }
}
