import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:consumerteamui/font/autoicons.dart';

class SkuDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: new Text("商品名细", style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xFF02A7F0),
        leading: new IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: renderNestedScrollView(context)
    );
  }
  Widget renderNestedScrollView(context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
            pinned: false, // 头部是否固定
            toolbarHeight: 215,
            automaticallyImplyLeading: false, // 隐藏返回图标
            flexibleSpace: Container(
              decoration: BoxDecoration(color: Colors.white),
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  renderHeader(), renderCatetoryDesc(), 
                ],
              ),
            )
          ),
          SliverPadding(padding: EdgeInsets.only(top: 10)),
          SliverList(
            delegate: SliverChildListDelegate(
              [Container(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [renderTextDesc(), renderFooter()],
                ),
              )]
            )
          ),
      ],
    );
  }
  Widget renderHeader() {
    var imgIcon = Container(
      margin: EdgeInsets.fromLTRB(0, 0, 8, 0),
      width: 50,
      height: 50,
      child: Image.asset('/image/taocan.png', fit: BoxFit.fill),
    );
    var title = Expanded(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                child: Text('海底捞火锅聚会套餐'),
              ),
              Container(
                alignment: Alignment.centerRight,
                child: Text('\$28'),
              )
            ],
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(0, 8, 0, 0),
                alignment: Alignment.centerLeft,
                child: Text('商家：小厨王'),
              )
            ],
          )
        ],
      ),
    );
    return Row(
      children: [imgIcon, title],
    );
  }
  List<Widget> renderImgList(dataList) {
    Widget getItem(imgItem) {
      return Container(
        margin: EdgeInsets.fromLTRB(0, 0, 8, 0),
        width: 180,
        height: 80,
        child: Image.asset('/image/taocan.png', fit: BoxFit.fill),
      );
    };
    return dataList.map<Widget>((item) => getItem(item)).toList();
  }
  Widget renderCatetoryDesc() {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.symmetric(vertical: 16, horizontal: 0),
          child: Text('分类： 川菜 —> 火锅'),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: renderImgList([1,2,3, 5,6,7,8,9,1,1,1,1]),
          ),
        )
      ],
    );
  }
  Widget renderTextDesc() {
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.symmetric(vertical: 16, horizontal: 0),
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.fromLTRB(0, 0, 0, 8),
            child: Text('商品介绍：'),
          ),
           Container(
            alignment: Alignment.centerLeft,
            child: Text('我国的火锅，历史悠久，源远流长。浙江等地曾出土5000多年前的与陶釜配套使用的小陶灶，可以很方便地移动，可以算是火锅初级形式。北京延庆县龙庆峡山戎文化遗址中出土的春秋时期青铜火锅，有加热过的痕迹。奴隶社会后期，出现了一种小铜鼎，高不超过20厘米，口径15厘米左右。有的鼎与炉合二为一，即在鼎中铸有一个隔层，将鼎腹分为上下两部分，下层有一个开口，可以送入炭火，四周镂空作通风的烟孔。有的鼎腹较浅，鼎中间夹一炭盘，人们称这种类型的鼎为“温鼎”，它小巧便利，可以说是一种较好的火锅了', style: TextStyle(fontSize: 12)),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 16, 0, 0),
            child: DefaultTextStyle(
              style: TextStyle(fontSize: 12, color: Colors.black),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text('规格：800g，2-3人食用'),
                  Text('可开团时间：2021-8-1  -   2021-12-21'),
                  Text('送货方式： 送至团长处 '),
                  Text('成团额：500\$'),
                  Text('运费：1000\$ 免费配送，低于1000\$支付15\$'),
                  Text('准备时间：24小时')
                ],
              )
            )
          )
        ],
      ),
    );
  }
  Widget renderFooter() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 24, horizontal: 0),
      child: Icon(Autoicons.shop, color: Colors.red, size: 80),
    );
  }
}