import 'package:consumerteamui/team/views/home.dart';
import 'package:consumerteamui/views/entry.dart';
import 'package:flutter/material.dart';
import 'package:consumerteamui/team/views/sku_detail.dart';

Map<String, Widget Function(BuildContext)> teamRoutes = {
  "/": (context) => Entry(),
  "TeamHome": (context) => TeamHome(),
  "SkuDetail": (context) => SkuDetail(),
};