import 'package:flutter/material.dart';
import 'package:consumerteamui/app.dart';
import 'package:consumerteamui/constants.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart';
import 'package:consumerteamui/store/globalInfo.dart';

void main() {
  bool isTestMode = false;

  runApp(App(
    key: Key(APP_KEY),
    initialRoute: '/'
  ));
}
