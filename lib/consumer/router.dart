import 'package:consumerteamui/views/entry.dart';
import 'package:flutter/material.dart';

import 'package:consumerteamui/consumer/views/register.dart';
import 'package:consumerteamui/consumer/views/home.dart';

import 'package:consumerteamui/consumer/views/home/orders/take.dart'; //提货通知
import 'package:consumerteamui/consumer/views/home/orders/receiving.dart'; //待收货订单
import 'package:consumerteamui/consumer/views/home/orders/sendout.dart'; //待发货订单

import 'package:consumerteamui/consumer/views/product/lib/detail.dart'; //商品详情

import 'package:consumerteamui/consumer/views/home/orders/paid/paid.dart'; //待支付订单
import 'package:consumerteamui/consumer/views/home/orders/paid/paid-detail.dart'; //待支付订单

Map<String, Widget Function(BuildContext)> consumerRoute = {
  "/": (context) => Entry(),
  "Register": (context) => Register(),
  "ConsumerHome": (context) => ConsumerHome(),
  "TakePage": (context) => TakePage(),
  "ReceivingPage": (context) => ReceivingPage(),
  "SendoutPage": (context) => SendoutPage(),
  "PaidPage": (context) => PaidPage(),
  "PaidDetail": (context) => PaidDetail(),
  "DetailProduct": (context) => DetailProduct(),
};
