import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:consumerteamui/font/autoicons.dart';
import 'SkuModel.dart';
class TeamHome extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => TeamHomeState();
}
class TeamHomeState extends State<TeamHome> {
  var branchStoreValue = null; // 分店
  List<bool> distributionModes = [false, false, false]; // 送货方式
  List<SkuModel> skuList = [];
  String searchText = '';
  //设置搜索防抖
  Duration durationTime = Duration(milliseconds: 500);
  Timer timer = new Timer(Duration.zero, () =>{});
  FocusNode _focusNode = FocusNode();
  TextEditingController _searchTextController = TextEditingController();
  @override
  void initState() {
    this.getAndSetSkuList();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: new Text("开团", style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xFF02A7F0),
        leading: new IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
          },
        ),
      ),
      body: GestureDetector(
        child: renderNestedScrollView(context),
        behavior: HitTestBehavior.translucent,
        onTap: (){
          // FocusScope.of(context).requestFocus(_focusNode);
          _focusNode.unfocus();
        },
      )
    );
  }
  void getAndSetSkuList(){
    final num = new Random().nextInt(3);
    print(num);
    List<String> tList = ['小龙虾', '大龙虾', '老龙虾'];
    List<SkuModel> list = [];
     for (var i = 0; i < 10; i++) {
      list.add(
        SkuModel(
        "${tList[num]}${i}",
         220.0 + i,
        "规格：800g，2-3人食用",
        "可开团时间：2021-8-1  -   2021-12-21",
        "送货方式：送至团长处 ",
        "成团额：500\$",
        "运费：1000\$ 免费配送，低于1000\$支付15\$",
        "准备时间：24小时"
      ));
    }
    setState(() {
      skuList = list;
    });
  }
  Widget renderNestedScrollView(context) {
    return NestedScrollView(
      headerSliverBuilder: (BuildContext bContext, bool innerBoxIsScrolled) {
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
                renderConditions(context),
              ],
            ),
          )
        )];
      },
      body: new ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: skuList.length,
        itemBuilder: (BuildContext ctxt, int index) {
          return renderMenuItem(context, index);
        },
      ),
    );
  }

  Widget renderConditions(context) {
    return Row(
      children: [
        SizedBox(
          width: 100,
          height: 80,
          child: Image.asset('assets/images/haidilao.png',fit: BoxFit.fill,)
        ),
        Expanded(
          child: Container(
            margin: EdgeInsets.fromLTRB(16, 0, 16, 0),
            child: renderBranchStoreSelect(context),
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
            renderMenuBody(context, index)
          ],
        ),
      ),
    );
  }
  Widget renderMenuTitle(context, index) {
     SkuModel item = skuList[index];
    return GestureDetector(
      onTap: () => {
        Navigator.pushNamed(context, 'SkuDetail')
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset('assets/images/xia.png',width: 50, height: 50),
          Expanded(child: Container(child: Text(item.name), alignment: Alignment.center)),
          Text(item.price.toString())
        ],
      ),
    );
  }
  Widget renderMenuBody(context, index) {
    SkuModel item = skuList[index];
    return Row(
        children: [
          Expanded(
            child: Container(
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(item.name1, style: TextStyle(fontSize: 12)),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(item.name2, style: TextStyle(fontSize: 12)),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(item.name3, style: TextStyle(fontSize: 12)),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(item.name4, style: TextStyle(fontSize: 12)),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(item.name5, style: TextStyle(fontSize: 12)),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(item.name6, style: TextStyle(fontSize: 12)),
                  ),
                ],
              ),
            )
          ),
          Container(
            height: 70,
            margin: EdgeInsets.only(right: 8),
            alignment: Alignment.bottomCenter,
            child: IconButton(
              onPressed: (){
                Navigator.pushNamed(context, 'ShoppingCart');
              },
              icon: Icon(Autoicons.shop, color: Colors.red, size: 40),
            ),
          )
        ],
    );
  }
  void showLoading(BuildContext context, String text) {
  text = text == null ?"Loading..." : text;
  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return Center(
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(3.0),
                boxShadow: [
                  //阴影
                  BoxShadow(
                    color: Colors.black12,
                    //offset: Offset(2.0,2.0),
                    blurRadius: 10.0,
                  )
                ]),
            padding: EdgeInsets.all(16),
            margin: EdgeInsets.all(16),
            constraints: BoxConstraints(minHeight: 120, minWidth: 180),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 30,
                  width: 30,
                  child: CircularProgressIndicator(
                    strokeWidth: 3,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Text(
                    text,
                    style: Theme.of(context).textTheme.body2,
                  ),
                ),
              ],
            ),
          ),
        );
      });
  }
  Widget renderBranchStoreSelect(context) {
    return DropdownButton(
      value: branchStoreValue,
      dropdownColor: Colors.white,
      isExpanded: true,
      hint: Text('请选择分店名称'),
      underline: Container(height: 0),
      items: [
        DropdownMenuItem(child: Text('海底捞-大学城店'),value: "1"),
        DropdownMenuItem(child: Text('海底捞-新加坡总店'),value: "2"),
        DropdownMenuItem(child: Text('迪士尼乐园店'),value: "3"),
      ],
      onChanged: (val){
        setState(() {
           branchStoreValue = val!;
           showLoading(context, '加载中');
           Timer(Duration(milliseconds: 500), ()=> {
             Navigator.of(context).pop(1), getAndSetSkuList()
           });
        });
      },
    );
  }
  Widget renderCheckboxTypes () {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 16, horizontal: 0) ,
      child: Flex(
        direction: Axis.horizontal,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            width: 28,
            child:  Checkbox(value: distributionModes[0], onChanged: (bool){
              setState(() {
                distributionModes[0] = bool!;
              });
            }),
          ),
          Text('团长处提货'),
          SizedBox(
            width: 28,
            child:   Checkbox(value: distributionModes[1], onChanged: (bool){
              setState(() {
                distributionModes[1] = bool!;
              });
            }),
          ),
          Text('门店直送'),
          SizedBox(
            width: 28,
            child:  Checkbox(value: distributionModes[2], onChanged: (bool){
              setState(() {
                distributionModes[2] = bool!;
              });
            }),
          ),
          Text('到店自取'),
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
        controller: _searchTextController,
        focusNode: _focusNode,
        onChanged: (str){
          if( timer != null) {
           timer.cancel();
          }
          setState(() {
            searchText = str;
            timer = new Timer(durationTime, () {
              print(str);
            });
          });
        },
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
          suffixIcon: IconButton(icon: Icon(Icons.close, size: 16), onPressed: (){
            clearSearchText();
            _focusNode.unfocus();
          }),
        ),
      ),
    );
  }
   void clearSearchText() {
    _searchTextController.text = '';
    setState(() {
      searchText = '';
    });
  }
}