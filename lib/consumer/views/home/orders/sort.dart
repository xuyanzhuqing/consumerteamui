import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Sort extends StatefulWidget {
  Sort({Key? key}) : super(key: key);
  @override
  _SortState createState() => _SortState();
}

class _SortState extends State<Sort> {
  List<Leftitem> leftList = [];
  List<Rightitem> rightList = [];

  @override
  void initState() {
    this.getData();
    super.initState();
  }

  void getData() {
    List<Leftitem> Llist = [];
    List<Rightitem> Rlist = [];
    for (var i = 0; i < 20; i++) {
      Llist.add(Leftitem(
        title: "选中${i}",
      ));
      Rlist.add(Rightitem(
        title: "选中${i}",
        imgUrl:
            "https://api.imvideo.app/imapi-node/api/v1/toolkit/langplay_img/343ad6b2bba4aa7aad9955b39d64c455.jpg",
        desc: "水电费水电水电费水电水电费水电水电费水电水电费水电水电费水电",
        goUrl: "3423423",
      ));
    }
    setState(() {
      leftList = Llist;
      rightList = Rlist;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 80,
            child: ListView.builder(
              shrinkWrap: true, //使用子控件的总长度来设置ListView的长度（这里的长度为高度）
              scrollDirection: Axis.vertical,
              physics: new NeverScrollableScrollPhysics(), //禁止滚动
              itemCount: leftList.length,
              itemBuilder: (BuildContext ctxt, int index) {
                return renderLeftItem(context, index);
              },
            ),
          ),
          Flexible(
            child: Container(
                padding: EdgeInsets.only(left: 10),
                child: ListView.builder(
                  shrinkWrap: true, //使用子控件的总长度来设置ListView的长度（这里的长度为高度）
                  physics: new NeverScrollableScrollPhysics(), //禁止滚动
                  scrollDirection: Axis.vertical,
                  itemCount: rightList.length,
                  itemBuilder: (BuildContext ctxt, int i) {
                    return renderRightItem(context, i);
                  },
                )),
          )
        ],
      ),
    );
  }

  Widget renderLeftItem(context, index) {
    return new InkWell(
        onTap: () {
          print("renderLeftItem $index");
          setState(() {
            leftList.forEach((item) {
              item.isSelected = false;
            });
            leftList[index].isSelected = true;
          });
        },
        child: Container(
            padding: EdgeInsets.only(top: 10, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  width: 4,
                  height: 24,
                  color: leftList[index].isSelected
                      ? Colors.red
                      : Colors.transparent,
                ),
                Text("${leftList[index].title}",
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontSize: 16,
                      color: leftList[index].isSelected
                          ? Colors.red
                          : Colors.black,
                    )),
              ],
            )));
  }

  Widget renderRightItem(context, i) {
    return new InkWell(
        onTap: () {
          print("renderRightItem $i");
          print(rightList[i].goUrl);
        },
        child: Container(
          margin: EdgeInsets.only(top: 10, bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                  width: 100,
                  child: Image.network(
                      "https://api.imvideo.app/imapi-node/api/v1/toolkit/langplay_img/343ad6b2bba4aa7aad9955b39d64c455.jpg")),
              Expanded(
                  child: Container(
                      padding: EdgeInsets.only(left: 5, right: 5),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              child: Text(rightList[i].title,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                  )),
                            ),
                            Container(
                              child: Text(rightList[i].desc,
                                  textAlign: TextAlign.left,
                                  softWrap: true,
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.black,
                                  )),
                            ),
                            Container(
                              child: ButtonTheme(
                                textTheme: ButtonTextTheme.primary,
                                height: 12,
                                child: RaisedButton(
                                  child: Text('添加'),
                                  onPressed: () {
                                    print(i);
                                  },
                                ),
                              ),
                            )
                          ])))
            ],
          ),
        ));
  }
}

class Leftitem {
  Leftitem({required this.title, this.isSelected = false});
  // 按钮名称
  String title;
  //是否选种
  bool isSelected;
}

class Rightitem {
  Rightitem({
    required this.title,
    required this.imgUrl,
    required this.desc,
    this.goUrl,
  });
  // 按钮名称
  String title;
  // 按钮图片
  String imgUrl;
  // 描述
  String desc;
  //跳转路由
  String? goUrl;
}
