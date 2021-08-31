import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:consumerteamui/font/autoicons.dart';

class ShoppingCart extends StatelessWidget {
  var groupValue = null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: new Text("购物车", style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xFF02A7F0),
        leading: new IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: <Widget>[
          new TextButton(
            child: Container(
              margin: EdgeInsets.only(right: 8),
              child: Text('清空失效商品', style: TextStyle(color: Colors.white, fontWeight: FontWeight.normal)),
            ),
            onPressed: () {}
          ),
        ],
      ),
      body: renderNestedScrollView(context)
    );
  }
  Widget renderNestedScrollView(context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
            pinned: false, // 头部是否固定
            toolbarHeight: 0,
            automaticallyImplyLeading: false, // 隐藏返回图标
            flexibleSpace: Container(
              decoration: BoxDecoration(color: Colors.white),
              padding: EdgeInsets.all(16),
            )
          ),
          SliverPadding(padding: EdgeInsets.only(top: 10)),
          SliverList(
            delegate: SliverChildBuilderDelegate((content, index) {
              return renderSku(index);
            }, childCount: 20),
          ),
      ],
    );
  }
  Widget renderSku(index) {
    return Container(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(8),
            alignment: Alignment.center,
            child: getStoreHeader()
          ),
          Container(
            margin: EdgeInsets.only(top: 16),
            child: Column(
              children: getItemList([1,2,3]),
            ),
          )
        ],
      )
    );
  }
  List<Widget> getItemList(dataList) {
    Widget getItem(item) {
      return Card(
        child: Container(
          padding: EdgeInsets.all(8),
          child: Row(
            children: [
              getSkuRadio(),
              getSkuDetail(),
              MaterialButton(
                color: Colors.red,
                child: Text('删除', style: TextStyle(color: Colors.white)),
                onPressed: (){}
                )
            ],
          ),
        )
      );
    };
    return dataList.map<Widget>((item) => getItem(item)).toList();
  }
  Widget getStoreHeader() {
    var skuIcon = Container(
      width: 80,
      height: 60,
      child: Image.asset('assets/images/taocan.png', fit: BoxFit.fill),
    );
    var skuName = Expanded(
      child: Container(
        alignment: Alignment.center,
        child: Text('海底捞-新加坡大学城店'),
      ),
    );
    return Row(
      children: [skuIcon, skuName],
    );
  }
  Widget getSkuRadio() {
    return  Container(
      child: Radio(
        value: 1,
        groupValue: this.groupValue,
        onChanged: (v){
          print('radio ${v}');
          this.groupValue = v;
        }
      ),
    );
  }
  Widget getSkuTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset('assets/images/xia.png',
          width: 50, height: 50
          ),
        Text("麻辣小龙虾（大）"),
        Text('\$280 / \$1.5')],
    );
  }
  Widget getSkuDetail() {
    return Expanded(
      child: DefaultTextStyle(
        style: TextStyle(fontSize: 12, color: Colors.black),
        child: Column(
          children: [
            getSkuTitle(),
            Container(
              alignment: Alignment.centerLeft,
              child: Text('规格：800g，2-3人食用'),
            ),
             Container(
              alignment: Alignment.centerLeft,
              child: Text('可开团时间：2021-8-1  -   2021-12-21'),
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Text('送货方式： 送至团长处'),
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Text('成团额：500\$'),
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Text('运费：1000\$ 免费配送，低于1000\$支付15\$'),
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Text('准备时间：24小时'),
            ),
          ],
        )
      )
    );
  }
}