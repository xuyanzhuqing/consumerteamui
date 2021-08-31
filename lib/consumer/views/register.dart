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

  bool selectRoleType = false;

  @override
  Widget build(BuildContext context) {
    var title = ModalRoute.of(context)?.settings.arguments;
    print(title);

    List<MyFormItem> items = [
      MyFormItem<String>(prop: "name", label: "用户名/手机号", which: Which.char, rules: MultiValidator([
        RequiredValidator(errorText: '用户名/手机号不能为空'),
        MaxLengthValidator(16, errorText: '最长16'),
      ])),
      MyFormItem<String>(prop: "password", label: "密码", which: Which.char),
      MyFormItem<String>(prop: "confirmPass", label: "确认密码", which: Which.char),
    ];
    return MyForm(
      formKey: formKey,
      title: "注册",
      items: items,
      onFiledChange: onFiledChange,
      onSubmit: onSubmit,
      onCancel: onCancel,
      submitLabel: '注册',
      hasCancelBtn: false,
      tailBtns: [
        MyFormItem(prop: "reset", label: "重置", which: Which.button, buttonStyle: MyButtonStyle.outline),
      ],
    );
  }

  void onFiledChange (String key, dynamic value) {
    print(key);
    print(value);
  }

  void onSubmit (model) {
    Navigator.of(context).pushNamed('Login');
    print(model.toString());
  }

  void onCancel (model) {
    print(model);
  }
}