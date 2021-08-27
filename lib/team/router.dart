import 'package:consumerteamui/team/views/home.dart';
import 'package:consumerteamui/views/entry.dart';
import 'package:flutter/material.dart';
import 'package:consumerteamui/team/views/sku_detail.dart';
import 'package:consumerteamui/team/views/shopping_cart.dart';

Map<String, Widget Function(BuildContext)> teamRoutes = {
  "/": (context) => Entry(),
  "TeamHome": (context) => TeamHome(),
  "SkuDetail": (context) => SkuDetail(),
  "ShoppingCart": (context) => ShoppingCart()
};