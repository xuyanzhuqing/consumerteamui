import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:consumerteamui/font/autoicons.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class TeamHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: new Text("开团", style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xFF02A7F0),
        leading: new IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {},
        ),
      ),
      body: renderNestedScrollView(context)
    );
  }

  Widget renderNestedScrollView(context) {
    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[SliverAppBar(
          pinned: true, // 头部是否固定
          toolbarHeight: 232,
          automaticallyImplyLeading: false, // 隐藏返回图标
          flexibleSpace: Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(color: Colors.white),
            child: Column(
              children: [
                renderSearchInput(),
                renderCheckboxTypes(),
                renderConditions(),
              ],
            ),
          )
        )];
      },
      body: new ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: 10,
        itemBuilder: (BuildContext ctxt, int index) {
          return renderMenuItem(context, index);
        },
      ),
    );
  }

  Widget renderConditions() {
    return Row(
      children: [
        SizedBox(
          width: 100,
          height: 80,
          child: Image.network(
            'https://img2.baidu.com/it/u=2565461193,1307648114&fm=26&fmt=auto&gp=0.jpg',
            fit: BoxFit.fill,
          )
        ),
        Expanded(
          child: Container(
            margin: EdgeInsets.fromLTRB(16, 0, 0, 0),
            child: renderBranchStoreSelect(),
          )
        )
      ],
    );
  }
  Widget renderMenuItem(context, index) {
    return Card(
      child: new Container(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            renderMenuTitle(context, index),
            renderMenuBody()
          ],
        ),
      ),
    );
  }
  Widget renderMenuTitle(context, index) {
    return GestureDetector(
      onTap: () => {
        Navigator.pushNamed(context, 'SkuDetail')
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.network('https://hbimg.huabanimg.com/cccaacd4138204a23fb036d2fc09ab9995381d39a695d-CfgljG_fw236/format/webp',
          width: 50, height: 50
          ),
          Text("${index}辣小龙虾（大）"),
          Text('\$280')
        ],
      ),
    );
  }
  Widget renderMenuBody() {
    return Row(
        children: [
          Expanded(
            child: Container(
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text('规格: 800g, 2-3人食用', style: TextStyle(fontSize: 12)),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text('可开团时间：2021-8-1  -   2021-12-21', style: TextStyle(fontSize: 12)),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text('送货方式： 送至团长处', style: TextStyle(fontSize: 12)),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text('成团额：500\$', style: TextStyle(fontSize: 12)),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text('运费：1000\$ 免费配送，低于1000\$支付15\$', style: TextStyle(fontSize: 12)),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text('送准备时间：24小时', style: TextStyle(fontSize: 12)),
                  ),
                ],
              ),
            )
          ),
          Container(
            height: 100,
            alignment: Alignment.bottomCenter,
            child: Icon(Autoicons.shop, color: Colors.red, size: 35),
          )
        ],
    );
  }
  Widget renderBranchStoreSelect() {
    return DropdownButton(
      value: '请选择分店名称',
       underline: Container(height: 0),
      items: [
        DropdownMenuItem(child: Text('请选择分店名称'),value: '请选择分店名称'),
        DropdownMenuItem(child: Text('语文'),value: '语文'),
        DropdownMenuItem(child: Text('数学'),value: '数学'),
        DropdownMenuItem(child: Text('英语'),value: '英语'),
      ],
      onChanged: (value){
      },
    );
  }
  Widget renderCheckboxTypes () {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 16, horizontal: 0) ,
      child: Row(
        children: <Widget>[
            Checkbox(value: true, onChanged: (bool){}),
            Baseline(
              baseline: 11,
              baselineType: TextBaseline.alphabetic,
              child: Text('团长处提货'),
            ),
            Checkbox(value: true, onChanged: (bool){}),
            Baseline(
              baseline: 11,
              baselineType: TextBaseline.alphabetic,
              child: Text('门店直送'),
            ),
            Checkbox(value: true, onChanged: (bool){}),
            Baseline(
              baseline: 11,
              baselineType: TextBaseline.alphabetic,
              child: Text('到店自取'),
            ),
        ]
      )
    );
  }
  Widget renderSearchInput () {
    return new ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: 34,
      ),
      child: TextField(
        autofocus: false,
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.search,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
          // focusedBorder: new OutlineInputBorder(  //有焦点时
          //   borderSide: BorderSide(color: Colors.red),
          //   borderRadius: BorderRadius.all(Radius.circular(999)),
          // ),
          border: OutlineInputBorder(
            ///设置边框四个角的弧度
            borderRadius: BorderRadius.all(Radius.circular(999)),
            ///用来配置边框的样式
            borderSide: BorderSide(color: Colors.red),
          ),
          hintText: "请输入",
          hintStyle: TextStyle(color: Colors.grey, fontSize: 14, height: 1),
          prefixIcon: Icon(Icons.search, size: 16),
          suffixIcon: Icon(Icons.close, size: 16),
        ),
      ),
    );
  }
}