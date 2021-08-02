import 'package:consumerteamui/team/views/home.dart';
import 'package:consumerteamui/views/entry.dart';
import 'package:flutter/material.dart';

Map<String, Widget Function(BuildContext)> teamRoutes = {
  "TeamHome": (context) => TeamHome(),
  "/": (context) => Entry()
};