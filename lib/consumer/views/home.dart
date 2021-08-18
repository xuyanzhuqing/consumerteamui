import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// class ConsumerHome extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('')),
//     );
//   }
// }

import "package:consumerteamui/consumer/views/footer/home.dart";
import "package:consumerteamui/consumer/views/footer/info.dart";
import "package:consumerteamui/consumer/views/footer/shopping.dart";
import "package:consumerteamui/consumer/views/footer/product.dart";

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
    Info(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
      ),
      body: PageList[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        fixedColor: Color(0xFFFF0000),
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
