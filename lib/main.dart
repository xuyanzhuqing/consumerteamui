import 'package:flutter/material.dart';
import 'package:consumerteamui/app.dart';
import 'package:consumerteamui/constants.dart';
import 'package:flutter/foundation.dart';

void main() {
  bool isTestMode = false;

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

  runApp(App(
    key: Key(APP_KEY),
    initialRoute: '/'
  ));
}
