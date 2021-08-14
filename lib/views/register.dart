import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:shake_animation_widget/shake_animation_widget.dart';
import 'package:consumerteamui/components/my_form.dart';
import 'package:consumerteamui/components/my_form_item.dart';

class Register extends StatefulWidget {
  @override
  _Register createState() => _Register();
}
class _Register extends State<Register> {
  Object value = {
    "name": "michael",
    "age": "18"
  };

  MultiValidator _nameValidator = MultiValidator([
    RequiredValidator(errorText: '用户密码不能为空'),
    MinLengthValidator(8, errorText: '最短6位'),
    MaxLengthValidator(16, errorText: '最长16'),
  ]);

  @override
  Widget build(BuildContext context) {
    List<MyFormItem> items = [
      MyFormItem(prop: "name", label: "姓名", which: Which.char, rules: _nameValidator),
      MyFormItem(prop: "age", label: "年龄", which: Which.char),
    ];

    return MyForm(
      title: "注册",
      value: value,
      items: items,
      onChange: onChange,
      onSubmit: onSubmit
    );
  }

  void onChange (Object newVal) {
    setState(() {
      this.value = newVal;
    });
  }

  void onSubmit (Object obj) {}
}