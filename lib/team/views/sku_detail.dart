import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:consumerteamui/font/autoicons.dart';

class SkuDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: new Text("开团"),
        backgroundColor: Color(0xFF02A7F0),
        leading: new IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
        ),
      ),
      body: Row(
          children: [
            ElevatedButton (
              child: Text("商品列表"),
              onPressed: () {
              },
            ),
            ElevatedButton (
              child: Text("normal"),
              onPressed: () {},
            ),
          ],
        ),
    );
  }
}