import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_field_validator/form_field_validator.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:shake_animation_widget/shake_animation_widget.dart';
import 'package:consumerteamui/components/my_form_item.dart';

class MyForm extends StatefulWidget {
  final ValueChanged<Object>? onChange;
  final ValueChanged<Object> onSubmit;

  MyForm({
    Key? key,
    required this.value,
    required this.items,
    required this.title,
    required this.onSubmit,
    this.onChange,
    this.submitLabel = "提交",
  }): super(key: key);

  final Object value;
  final String title;
  final String submitLabel;

  final List<MyFormItem> items;
  @override
  State<StatefulWidget> createState() => _MyForm();
}

class _MyForm extends State<MyForm> {
  Map<String, MyFormItemInner> myFormItemInner = new Map();

  List<String> orderList = [];

  List<Widget> list = [];

  @override
  void initState () {
    super.initState();
    orderList = widget.items.map((item) {
      return item.prop;
    }).toList();

    myFormItemInner.addAll(Map.fromIterable(widget.items,
      key: (item) => item.prop,
      value: (item) => MyFormItemInner(
        focusNode: new FocusNode(),
        textEditingController: new TextEditingController(),
        shakeAnimationController: new ShakeAnimationController(),
        streamController: new StreamController(),
        myFormItem: item
      )
    ));

    int len = orderList.length;
    for (int i = 0; i < len; i++) {
        String prop = orderList[i];
        MyFormItemInner item = myFormItemInner[prop] as MyFormItemInner;
        Which which = item.myFormItem.which;
        if (which == Which.char) {
          list.add(buildCharWidget(item, i));
        } else if (which == Which.button) {
          // list.add(buildButton());
        } else {

        }
        double gap = item.myFormItem.gap;
        list.add(SizedBox(height: gap));
    }

    // 增加提交按钮
    list.add(
      MyFormItem.buildButton(
        MyButtonStyle.primary,
        widget.submitLabel, () {
          if (validate()) {
            widget.onSubmit(widget.value);
          }
        }
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    
    //手势识别点击空白隐藏键盘
    return GestureDetector(
      onTap: () {
        hindKeyBoarder();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Center(child: Text(widget.title),),
        ),
        //登录页面的主体
        body: wrap(list),
      ),
    );
  }

  StreamBuilder<String> buildCharWidget(MyFormItemInner item, int index) {
  
    return StreamBuilder<String>(
      stream: item.streamController.stream,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        return ShakeAnimationWidget(
          //微左右的抖动
          shakeAnimationType: ShakeAnimationType.LeftRightShake,
          //设置不开启抖动
          isForward: false,
          //抖动控制器
          shakeAnimationController: item.shakeAnimationController,
          child: new TextField(
            focusNode: item.focusNode,
            controller: item.textEditingController,
            onSubmitted: (String value) {
              if (check(item)) {
                // 当前失去焦点
                item.focusNode.unfocus();
                // FocusScope.of(context).requestFocus(myFormItemInner[orderList[index]].focusNode);
              } else {
                FocusScope.of(context).requestFocus(item.focusNode);
              }
            },
            //隐藏输入的文本
            obscureText: true,
            //最大可输入1行
            maxLines: 1,
            //边框样式设置
            decoration: InputDecoration(
              labelText: item.myFormItem.label,
              errorText: snapshot.data,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
          ),
        );
      },
    );
  }

  bool validate () {
    hindKeyBoarder();
    List<bool> allCheck = [];
    myFormItemInner.forEach((key, value) {
      allCheck.add(check(value));
    });

    return !allCheck.contains(false);
  }

  bool check (MyFormItemInner item) {
    MultiValidator? validator = item.myFormItem.rules;
    if (validator?.isValid != null) {
      //获取输入框中的输入文本
      String? text = item.textEditingController.text;
      bool res = validator!.isValid(text);
      if (!res) {
        //Stream 事件流更新提示文案
        item.streamController.add(validator.call(text) as String);
        //抖动动画开启
        item.shakeAnimationController.start();
      } else {
        //清除错误提示
        item.streamController.add(null as String);
      }
      return res;
    }
    return true;
  }

  void hindKeyBoarder() {
    // 输入框失去焦点
    myFormItemInner.forEach((key, value) {
      value.focusNode.unfocus();
    });

    // 隐藏键盘
    SystemChannels.textInput.invokeMethod('TextInput.hide');
  }


  Widget wrap (List<Widget> list)  {
    return Container(
      margin: EdgeInsets.all(30.0),
      //线性布局
      child: SingleChildScrollView(
        child: Column(
          children: list,
        )
      )
    );
  }
}
