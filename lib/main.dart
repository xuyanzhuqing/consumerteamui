import 'package:shared_preferences/shared_preferences.dart';
import 'package:consumerteamui/enum/biz.dart' show Roles;

import 'package:flutter/material.dart';
import 'package:consumerteamui/app.dart';
import 'package:consumerteamui/constants.dart';
import 'package:flutter/foundation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // ErrorWidget.builder = (FlutterErrorDetails flutterErrorDetails) {
  //   // exceptionAsString
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: Text('发生错误　ohh...')
  //     ),
  //     body: Center(
  //       child: Text('报告错误'),
  //     )
  //   );
  // };
  // FlutterError.onError = (FlutterErrorDetails details) => {}
  // 判断是否有用户数据
  SharedPreferences prefs = await SharedPreferences?.getInstance();
  var roleType = prefs.getString('roleType') ?? Roles.nope;
  String initialRoute = roleType == Roles.nope ? '/' : 'Login';
  print(initialRoute);
  print('--------------');
  runApp(App(
      key: Key(APP_KEY), initialRoute: initialRoute, role: roleType as Roles));
}
