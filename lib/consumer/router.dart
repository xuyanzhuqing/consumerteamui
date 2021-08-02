import 'package:consumerteamui/consumer/views/home.dart';
import 'package:consumerteamui/views/entry.dart';
import 'package:flutter/material.dart';

Map<String, Widget Function(BuildContext)> consumerRoute = {
  "ConsumerHome": (context) => ConsumerHome(),
  "/": (context) => Entry()
};