import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:consumerteamui/iconBuild/fonts/autoicons.dart';

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
        child: renderSearchInput()
      )
    );
  }
  Widget renderCheckboxTypes () {
    return new Row(
      children: [
        CheckboxListTile(value: true, title: Text(''), onChanged: (bool){})
      ],
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