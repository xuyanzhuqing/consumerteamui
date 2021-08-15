import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:consumerteamui/components/my_form/my_form.dart';

class Register extends StatefulWidget {
  @override
  _Register createState() => _Register();
}
class _Register extends State<Register> {
  GlobalKey formKey= new GlobalKey<FormState>();

  List<MyFormItem> items = [
    MyFormItem<String>(prop: "name", initalValue: "", label: "姓名", which: Which.char, rules: MultiValidator([
      RequiredValidator(errorText: '用户密码不能为空'),
      MinLengthValidator(8, errorText: '最短6位'),
      MaxLengthValidator(16, errorText: '最长16'),
    ])),
    MyFormItem<String>(prop: "age", initalValue: '18', label: "年龄", which: Which.char),
    // MyFormItem(prop: "btn", label: "取消", which: Which.button, buttonStyle: MyButtonStyle.outline),
  ];

  @override
  Widget build(BuildContext context) {

    return MyForm(
      formKey: formKey,
      title: "注册",
      items: items,
      onFiledChange: onFiledChange,
      onSubmit: onSubmit,
      onCancel: onCancel
    );
  }

  void onFiledChange (String key, dynamic value) {
    print(key);
    print(value);
  }

  void onSubmit (model) {
    print(model.toString());
  }

  void onCancel (model) {
    print(model);
  }
}