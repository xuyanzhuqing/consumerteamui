import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:consumerteamui/font/autoicons.dart';

class TeamHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: new Text("开团", style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xFF02A7F0),
        leading: new IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white,),
          onPressed: () {},
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            renderSearchInput(),
            renderCheckboxTypes(),
            renderBody(),
          ],
        )
      )
    );
  }
  Widget renderBody() {
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
        Expanded(child: Container(
            decoration: BoxDecoration(color: Colors.red),
            child: Text('111'),
          )
        )
      ],
    );
  }
  Widget renderCheckboxTypes () {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 16, horizontal: 0) ,
      child: Row(
        children: <Widget>[
            Checkbox(value: true, onChanged: (bool){}),
            Baseline(
              baseline: 10,
              baselineType: TextBaseline.alphabetic,
              child: Text('团长处提货'),
            ),
            Checkbox(value: true, onChanged: (bool){}),
            Baseline(
              baseline: 10,
              baselineType: TextBaseline.alphabetic,
              child: Text('门店直送'),
            ),
            Checkbox(value: true, onChanged: (bool){}),
            Baseline(
              baseline: 10,
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
        autofocus: true,
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