// 系统路由，404，500
import 'package:consumerteamui/store/globalInfo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:consumerteamui/views/entry.dart';
import 'package:consumerteamui/views/not_found.dart';
import 'package:consumerteamui/views/login.dart';

Map<String, Widget Function(BuildContext)> sysRoutes = {
  "/": (context) => Entry(),
  "Login": (context) => Login(),
};

// 路由拦截
dynamic onGenerateRoute = (RouteSettings settings) {

  return MaterialPageRoute(builder: (context) {
    GlobalInfo globalInfo = Provider.of<GlobalInfo>(context, listen: false);
    Map<String, Widget Function(BuildContext)> routes = globalInfo.routes;
    String routeName = settings.name ?? '';

    // // 如果不是首次进入，则可以直接进入登陆
    // if (routeName == '/' && roleType != '') {
    //   return Login();
    // }

    if (!routes.containsKey(routeName)) {
      return NotFound();
    } else {
      Widget Function(BuildContext)? fn = routes[routeName];
      return fn!(context);
    }
  });
};
