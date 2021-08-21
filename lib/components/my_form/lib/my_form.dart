import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:consumerteamui/components/shake_animation_widget/shake_animation_widget.dart';
import 'package:consumerteamui/components/my_form/lib/my_form_item.dart';

typedef OnFiledChange = void Function (String key, dynamic value);
typedef OnChange = void Function (Map<String, dynamic> value);
typedef OnSubmit = void Function (Map<String, dynamic> value);

class MyForm extends StatefulWidget {
  final OnFiledChange? onFiledChange;
  final OnSubmit onSubmit;
  final Function? onCancel;

  MyForm({
    Key? key,
    required this.title,
    required this.items,
    required this.onSubmit,
    required this.formKey,
    this.tailBtns = const [],
    this.onCancel,
    this.onFiledChange,
    this.submitLabel = "提交",
    this.cancelLabel = "取消",
    this.hasCancelBtn = true
  }): super(key: key);

  final String title;
  final String submitLabel;
  final String cancelLabel;
  final bool hasCancelBtn;
  final GlobalKey formKey;

  final List<MyFormItem> items;
  final List<MyFormItem> tailBtns;

  @override
  State<StatefulWidget> createState() => _MyForm();

  @override
  bool operator == (Object other) => identical(this, other)
    || other is MyForm && title == other.title && submitLabel == other.submitLabel && cancelLabel == other.cancelLabel && hasCancelBtn == other.hasCancelBtn && items == other.items && tailBtns == other.tailBtns;

  @override
  int get hashCode => title.hashCode ^ submitLabel.hashCode ^ cancelLabel.hashCode ^ hasCancelBtn.hashCode ^ items.hashCode ^ tailBtns.hashCode;
}

class _MyForm extends State<MyForm> {
  Map<String, MyFormItemInner> myFormItemInner = new Map();

  Map<String, dynamic> model = new Map();

  List<Widget> addSysButton () {
    List<Widget> res = [];
    // 增加提交按钮
    res.add(
      MyFormItem.buildButton(
        widget.submitLabel, () {
          if (validate()) {
            widget.onSubmit(model);
          }
        }
      )
    );

    if (widget.hasCancelBtn) {
      res.add(SizedBox(height: 10,));
      res.add(
        MyFormItem.buildButton(
          widget.cancelLabel,
          () {
            hindKeyBoarder();
            widget.onCancel!(model);
          },
          buttonStyle: MyButtonStyle.outline
        )
      );
    }

    return res;
  }

  @override
  void initState () {
    super.initState();
    // 初始化
    Map<String, MyFormItemInner> innerList = Map();

    // 初始化输入框
    widget.items.forEach((item) {
      if (item.which == Which.char) {
        TextEditingController controller = new TextEditingController();
        // 初始化默认值
        controller.text = item.initalValue??"";
        model[item.prop] = item.initalValue;

        innerList[item.prop] = MyFormItemInner(
          focusNode: new FocusNode(),
          textEditingController: controller,
          shakeAnimationController: new ShakeAnimationController(),
          streamController: new StreamController(),
          myFormItem: item
        );
      }
    });

    myFormItemInner.addAll(innerList);
  }

  List<Widget> formItemList () {
    List<Widget> list = [];

    widget.items.forEach((element) {
      String prop = element.prop;

      // 仅仅更新属性
      Which which = element.which;
      if (which == Which.char) {
        MyFormItemInner item = myFormItemInner[prop]!.copyWith(
          myFormItem: element
        );
        myFormItemInner[prop] = item;
        list.add(buildCharWidget(item));
      } else if (which == Which.button) {
        list.add(MyFormItem.buildButton(element.label??"", () {}, buttonStyle: element.buttonStyle));
      } else if (which == Which.select){
        list.add(buildSwitchWidget(element));
        // 自定义组建
      }
      double gap = element.gap;
      list.add(SizedBox(height: gap));
    });

    // 确认，取消
    list.addAll(addSysButton());

    // 自定义按钮
    widget.tailBtns.forEach((element) {
      double gap = element.gap;
      list.add(SizedBox(height: gap));
      list.add(MyFormItem.buildButton(element.label??"", () {}, buttonStyle: element.buttonStyle));
    });
    return list;
  }

  @override
  Widget build(BuildContext context) {
    Widget wraper = wrap(
      formItemList()
    );
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
        body: wraper,
      ),
    );
  }

  StreamBuilder<String> buildCharWidget(MyFormItemInner item) {
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
          child: new TextFormField(
            focusNode: item.focusNode,
            controller: item.textEditingController,
            onChanged: (v) {
              if (check(item)) {
                onFiledChange(item.myFormItem.prop, v);
              }
            },
            onFieldSubmitted: (String value) {
              if (check(item)) {
                // 当前失去焦点
                item.focusNode.unfocus();
              } else {
                FocusScope.of(context).requestFocus(item.focusNode);
              }
            },
            validator: item.myFormItem.rules ?? MultiValidator([]),
            //隐藏输入的文本
            // obscureText: true,
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

  Switch buildSwitchWidget(MyFormItem item) {
    return Switch(
      value: item.initalValue,
      onChanged: (value) {
        onFiledChange(item.prop, value);
      }
    );
  }

  void onFiledChange (String key, dynamic value) {
    widget.onFiledChange!(key, value);
    model[key] = value;
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
        //抖动动画开启
        item.shakeAnimationController.start();
      }
      return res;
    }
    return true;
  }

  void hindKeyBoarder() {
    // 输入框失去焦点
    myFormItemInner.forEach((key, value) {
      if (value.focusNode.hasFocus) {
        value.focusNode.unfocus();
      }
    });

    // 隐藏键盘
    SystemChannels.textInput.invokeMethod('TextInput.hide');
  }

  Widget wrap (List<Widget> list)  {
    return Container(
      margin: EdgeInsets.all(30.0),
      //线性布局
      child: SingleChildScrollView(
        child: Form(
          key: widget.formKey, //设置globalKey，用于后面获取FormState
          autovalidate: true, 
          child: Column(
            children: list,
          ),
        )
      )
    );
  }

  @override
  void dispose() {
    super.dispose();
    myFormItemInner.forEach((key, value) {
      value.textEditingController.dispose();
      value.shakeAnimationController.stop();
    });
  }
}
