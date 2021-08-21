import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:matcher/matcher.dart';

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
      padding: const EdgeInsets.only(top: 0, left: 4, right: 4, bottom: 8),
      child: Column(children: <Widget>[
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
              goUrl: "Receivingpage",
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
                  "通知消息通知消息通知消息通知消息通知消息通知消息",
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
    return Row(
      children: <Widget>[
        Container(
          color: Colors.blue,
          height: 50,
          width: 406,
        ),
      ],
    );
  }
}

class LeftView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ListTile(
          title: Text("你好这是一个列表"),
        ),
        ListTile(
          title: Text("你好这是一个列表"),
        ),
      ],
    );
  }
}
