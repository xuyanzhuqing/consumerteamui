import 'dart:async';

import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:consumerteamui/consumer/components/good-item.dart';

class PaidPage extends StatefulWidget {
  PaidPage({Key? key}) : super(key: key);

  @override
  _PaidPageState createState() => _PaidPageState();
}

class _PaidPageState extends State<PaidPage> {
  //用户名输入框的焦点控制
  FocusNode focusNode = new FocusNode();

  //文本输入框控制器
  TextEditingController textEditingController = new TextEditingController();

  //Stream 更新操作控制器
  StreamController<String> streamController = new StreamController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("待支付订单"),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            buildCharWidget(),
            SizedBox(
              height: 16.0,
            ),
            Expanded(
              child: ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                return GoodItem.itemBuilder(
                  index,
                  () => {
                    Navigator.of(context).pushNamed('PaidDetail'),
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  // 顶部搜索框
  StreamBuilder<String> buildCharWidget() {
    return StreamBuilder<String>(
      stream: streamController.stream,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        return new TextFormField(
          focusNode: focusNode,
          controller: textEditingController,
          onChanged: (v) {
            // 开始搜索
          },
          validator: MultiValidator([]),
          //最大可输入1行
          maxLines: 1,
          //边框样式设置
          decoration: InputDecoration(
            labelText: '',
            hintText: '请输入团长、商家名称、商品关键字??',
            errorText: snapshot.data,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            suffixIcon: Padding(
              padding: EdgeInsets.all(0.0),
              child: Icon(
                Icons.search,
                color: Colors.grey,
              ), // icon is 48px widget.
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    textEditingController.dispose();
  }
}
