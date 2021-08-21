// 系统路由，404，500
import 'package:consumerteamui/store/globalInfo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:consumerteamui/views/entry.dart';
import 'package:consumerteamui/views/not_found.dart';
import 'package:consumerteamui/views/register.dart';

import 'package:consumerteamui/consumer/views/home.dart';
import 'package:consumerteamui/consumer/views/info/take.dart'; //提货通知
import 'package:consumerteamui/consumer/views/info/receiving.dart'; //待收货订单
import 'package:consumerteamui/consumer/views/info/sendout.dart'; //待发货订单
import 'package:consumerteamui/consumer/views/info/paid.dart'; //待支付订单

Map<String, Widget Function(BuildContext)> sysRoutes = {
  "/": (context) => Entry(),
  "register": (context) => Register(),
  "consumerHome": (context) => ConsumerHome(),
  "takePage": (context) => TakePage(),
  "receivingPage": (context) => ReceivingPage(),
  "sendoutPage": (context) => SendoutPage(),
  "paidPage": (context) => PaidPage(),
};

// 路由拦截
dynamic onGenerateRoute = (RouteSettings settings) {
  return MaterialPageRoute(builder: (context) {
    GlobalInfo globalInfo = Provider.of<GlobalInfo>(context, listen: false);
    Map<String, Widget Function(BuildContext)> routes = globalInfo.routes;
    String routeName = settings.name ?? '';
    if (!routes.containsKey(routeName)) {
      return NotFound();
    } else {
      Widget Function(BuildContext)? fn = routes[routeName];
      return fn!(context);
    }
  });
};
