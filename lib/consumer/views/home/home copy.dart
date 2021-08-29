import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './orders/orders.dart';
import 'package:consumerteamui/components/loop_notice.dart';

import '../adapt.dart';

class Homepage extends StatefulWidget {
  final bool isHead;
  Homepage({
    Key? key,
    this.isHead = false,
  }) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  get isHead => null;
  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.only(top: 0, left: 4, right: 4, bottom: 8),
      child: Column(children: <Widget>[
<<<<<<< HEAD
        Notice(),
        UserCon(),
        // HeadCon(),
        ListContent(),
      ]),
    );
  }
}

class UserCon extends StatelessWidget {
  const UserCon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: GridView.count(
          //水平子Widget之间间距
          crossAxisSpacing: 10.0,
          //垂直子Widget之间间距
          mainAxisSpacing: 5.0,
          //GridView内边距
          padding: EdgeInsets.all(10.0),
          //一行的Widget数量
          crossAxisCount: 4,
          //子Widget列表
          children: <Widget>[
            ItemBotton(
              Txt: "提货通知",
              IconData: IconData(0xe61b, fontFamily: 'Albb'),
              goUrl: "TakePage",
            ),
            ItemBotton(
              Txt: "待收货订单",
              IconData: IconData(0xe637, fontFamily: 'Albb'),
              goUrl: "ReceivingPage",
            ),
            ItemBotton(
              Txt: "待发货订单",
              IconData: IconData(0xe633, fontFamily: 'Albb'),
              goUrl: "SendoutPage",
            ),
            ItemBotton(
              Txt: "待支付订单",
              IconData: IconData(0xe617, fontFamily: 'Albb'),
              goUrl: "PaidPage",
            ),
          ]),
    );
  }
}

class ItemBotton extends StatelessWidget {
  var Txt;
  var IconData;
  var goUrl;
  ItemBotton({
    Key? key,
    required this.Txt,
    required this.IconData,
    required this.goUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: new InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(goUrl);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            IconData,
            size: 35,
            color: Colors.brown,
          ),
          Container(
            padding: EdgeInsets.only(top: 5),
            child: Text(
              Txt,
              style: TextStyle(color: Colors.brown, fontSize: 14),
            ),
          )
        ],
      ),
    ));
  }
}

class HeadCon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: GridView.count(
          //水平子Widget之间间距
          crossAxisSpacing: 10.0,
          //垂直子Widget之间间距
          mainAxisSpacing: 5.0,
          //GridView内边距
          padding: EdgeInsets.all(10.0),
          //一行的Widget数量
          crossAxisCount: 4,
          //子Widget列表
          children: <Widget>[
            ItemBotton(
              Txt: "进行中",
              IconData: IconData(0xe63f, fontFamily: 'Albb'),
              goUrl: "Takepage",
            ),
            ItemBotton(
              Txt: "待支付",
              IconData: IconData(0xe617, fontFamily: 'Albb'),
              goUrl: "ReceivinPage",
            ),
            ItemBotton(
              Txt: "历史记录",
              IconData: IconData(0xe617, fontFamily: 'Albb'),
              goUrl: "Sendoutpage",
            ),
            ItemBotton(
              Txt: "开新团",
              IconData: IconData(0xe649, fontFamily: 'Albb'),
              goUrl: "Paidpage",
            ),
          ]),
    );
  }
}

class Notice extends StatelessWidget {
  const Notice({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(5.0),
      child: new InkWell(
          onTap: () {
            print("NoticeNoticeNotice");
          },
          child: Row(
            children: [
              Icon(
                IconData(0xe61b, fontFamily: 'Albb'),
                size: 25,
                color: Colors.brown,
              ),
              Container(
                padding: EdgeInsets.only(left: 5),
                child: Text(
                  "通知消息通知消息通知消息通知消息通消息",
                  style: TextStyle(color: Colors.brown, fontSize: 14),
                ),
              )
            ],
          )),
    );
  }
}

class ListContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.2,
            height: 450,
            child: LeftView(),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.8,
            height: 450,
            child: RightView(),
          )
        ],
      ),
    );
  }
}

class LeftView extends StatefulWidget {
  LeftView({Key? key}) : super(key: key);

  @override
  _LeftViewState createState() => _LeftViewState();
}

class _LeftViewState extends State<LeftView> {
  final state = HomeState();
  @override
  Widget build(BuildContext context) {
    return ListView(
        children:
            new List<Widget>.from(state.leftItemList.asMap().keys.map((i) {
      return new InkWell(
          onTap: () {
            print("NoticeNoticeNotice $i");
            setState(() {
              state.leftItemList.forEach((item) {
                item.isSelected = false;
              });
              state.leftItemList[i].isSelected = true;
            });
          },
          child: Container(
            alignment: Alignment.center,
            height: 50,
            color: state.leftItemList[i].isSelected
                ? Colors.red
                : Colors.transparent,
            child: Text(
              state.leftItemList[i].title,
            ),
          ));
    })).toList());
  }
}

class RightView extends StatefulWidget {
  RightView({Key? key}) : super(key: key);

  @override
  _RightViewState createState() => _RightViewState();
}

class _RightViewState extends State<RightView> {
  final state2 = HomeState2();
  @override
  Widget build(BuildContext context) {
    return ListView(
        padding: EdgeInsets.only(
          left: 10,
        ),
        children:
            new List<Widget>.from(state2.rightItemList.asMap().keys.map((i) {
          return Container(
            margin: EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                    width: 90.0,
                    height: 90.0,
                    child: Image.network(state2.rightItemList[i].imgUrl)),
                Container(
                    padding: EdgeInsets.only(left: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          child: Text(
                            state2.rightItemList[i].title,
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Container(
                          child: Text(
                            "sdfsdfsdfdsdsfddfdsdsf",
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Container(
                          child: Text(
                            "sdfsdfsdfdsdsfddfdsdsf",
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Container(
                          child: Text(
                            "sdfsdfsdfdsdsfddfdsdsf",
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Container(
                          child: Text(
                            "sdfsdfsdfdsdsfddfdsdsf",
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ))
              ],
            ),
          );
        })).toList());
=======
        LoopNotice(
          tip: '通知消233息通22222知消息通知消息通知消息',
          textStyle: TextStyle(fontSize: 14.0),
        ),
        Orders(),
      ]),
    );
>>>>>>> 7e488cb77102bb59733392d55d8cf6cd499efcb7
  }
}

class HomeState {
  ///左边导航栏
  late List<HomeLeftTabItem> leftItemList;
  HomeState() {
    leftItemList = [
      HomeLeftTabItem(
        title: 'Tab1',
        isSelected: true,
      ),
      HomeLeftTabItem(
        title: 'Tab2',
        isSelected: false,
      ),
      HomeLeftTabItem(
        title: 'Tab3',
        isSelected: false,
      ),
      HomeLeftTabItem(
        title: 'Tab4',
        isSelected: false,
      ),
      HomeLeftTabItem(
        title: 'Tab5',
        isSelected: false,
      ),
      HomeLeftTabItem(
        title: 'Tab6',
        isSelected: false,
      ),
      HomeLeftTabItem(
        title: 'Tab7',
        isSelected: false,
      ),
      HomeLeftTabItem(
        title: 'Tab8',
        isSelected: false,
      ),
      HomeLeftTabItem(
        title: 'Tab9',
        isSelected: false,
      ),
      HomeLeftTabItem(
        title: 'Tab10',
        isSelected: false,
      ),
    ];
  }
}

class HomeState2 {
  ///左边导航栏
  late List<HomeRightItem> rightItemList;
  HomeState2() {
    rightItemList = [
      HomeRightItem(
        title: "测试1",
        imgUrl:
            "https://api.imvideo.app/imapi-node/api/v1/toolkit/langplay_img/343ad6b2bba4aa7aad9955b39d64c455.jpg%3Fiopcmd%3Dthumbnail%26type%3D13%26width%3D96%26height%3D96",
        goUrl: "测试1",
      ),
      HomeRightItem(
        title: "测试1",
        imgUrl:
            "https://api.imvideo.app/imapi-node/api/v1/toolkit/langplay_img/343ad6b2bba4aa7aad9955b39d64c455.jpg%3Fiopcmd%3Dthumbnail%26type%3D13%26width%3D96%26height%3D96",
        goUrl: "测试1",
      ),
      HomeRightItem(
        title: "测试1",
        imgUrl:
            "https://api.imvideo.app/imapi-node/api/v1/toolkit/langplay_img/343ad6b2bba4aa7aad9955b39d64c455.jpg%3Fiopcmd%3Dthumbnail%26type%3D13%26width%3D96%26height%3D96",
        goUrl: "测试1",
      ),
    ];
  }
}

class HomeLeftTabItem {
  ///按钮名称
  String title;

  ///是否被选中
  bool isSelected;
  HomeLeftTabItem({
    required this.title,
    this.isSelected = false,
  });
}

class HomeRightItem {
  ///按钮名称
  String title;
  //图片
  String imgUrl;
  //路由
  String goUrl;

  ///是否被选中
  HomeRightItem({
    required this.title,
    required this.imgUrl,
    required this.goUrl,
  });
}
