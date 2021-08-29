import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:consumerteamui/consumer/views/home/home.dart';
import 'package:consumerteamui/consumer/views/about/about.dart';
import 'package:consumerteamui/consumer/views/shopping/shopping.dart';
import 'package:consumerteamui/consumer/views/product/product.dart';

class ConsumerHome extends StatefulWidget {
  ConsumerHome({Key? key}) : super(key: key);

  @override
  _ConsumerHomeState createState() => _ConsumerHomeState();
}

class _ConsumerHomeState extends State<ConsumerHome> {
  int currentIndex = 0;
  List PageList = [
    Homepage(),
    Product(),
    Shopping(),
    About(),
  ];
  @override
  Widget build(BuildContext context) {
    var screenSize;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0.0), //设置高度
        child: AppBar(
          automaticallyImplyLeading: true,
          elevation: 2.0,
          backgroundColor: Theme.of(context).colorScheme.primaryVariant,
          title: Text(""),
        ),
      ),
      body: PageList[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        fixedColor: Theme.of(context).colorScheme.primaryVariant,
        onTap: (int index) {
          setState(() {
            currentIndex = index;
          });
          // _changePage(index);
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            // icon: Icon(Icons.airplay),
            icon: Icon(IconData(0xe602, fontFamily: 'Albb')),
            title: Text(
              '首页',
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(IconData(0xe7f9, fontFamily: 'Albb')),
            title: Text(
              '分类',
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(IconData(0xe620, fontFamily: 'Albb')),
            title: Text(
              '购物车',
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(IconData(0xe60e, fontFamily: 'Albb')),
            title: Text(
              '我的',
            ),
          ),
        ],
      ),
    );
  }
}
