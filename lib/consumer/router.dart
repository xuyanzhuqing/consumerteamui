import 'package:consumerteamui/views/entry.dart';
import 'package:flutter/material.dart';

// import 'package:consumerteamui/consumer/views/home.dart';
// "consumerHome": (context) => ConsumerHome(),

import 'package:consumerteamui/consumer/views/info/take.dart'; //提货通知
import 'package:consumerteamui/consumer/views/info/receiving.dart'; //待收货订单
import 'package:consumerteamui/consumer/views/info/sendout.dart'; //待发货订单
import 'package:consumerteamui/consumer/views/info/paid.dart'; //待支付订单

Map<String, Widget Function(BuildContext)> consumerRoute = {
  "/": (context) => Entry(),
  "takepage": (context) => TakePage(),
  "receivingpage": (context) => ReceivingPage(),
  "sendoutpage": (context) => SendoutPage(),
  "paidpage": (context) => PaidPage(),
};
