import 'package:shared_preferences/shared_preferences.dart';

import 'package:consumerteamui/store/globalInfo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:consumerteamui/components/my_form/my_form.dart';
import 'package:provider/provider.dart';
import 'package:consumerteamui/enum/biz.dart' show Roles;

class Login extends StatefulWidget {
  @override
  _Login createState() => _Login();
}

class _Login extends State<Login> {
  GlobalKey formKey = new GlobalKey<FormState>();

  Map<String, dynamic> _model = {"user": "", "password": ""};

  @override
  Widget build(BuildContext context) {
    // 判断来自哪个路由
    var title = ModalRoute.of(context)?.settings.arguments;

    print(title);

    List<MyFormItem> items = [
      MyFormItem<String>(
          prop: "user",
          label: "用户名/手机号",
          initalValue: _model['user'],
          which: Which.char,
          rules: MultiValidator([
            RequiredValidator(errorText: '用户名/手机号不能为空'),
          ])),
      MyFormItem<String>(
          prop: "password",
          initalValue: _model['password'] as String,
          label: "密码",
          which: Which.char,
          rules: MultiValidator([
            RequiredValidator(errorText: '密码不能为空'),
          ])),
    ];

    return MyForm(
      formKey: formKey,
      title: "登陆",
      items: items,
      onFiledChange: onFiledChange,
      onSubmit: onSubmit,
      submitLabel: '登陆',
      cancelLabel: '注册',
      onCancel: onCancel,
      // hasCancelBtn: false
    );
  }

  void onFiledChange(String key, dynamic value) {
    print('------------');
    print(key);
    print(value);
  }

  void onSubmit(model) {
    // TODO: mock 判断用户类型，跳转不同路由
    GlobalInfo globalInfo = Provider.of<GlobalInfo>(context, listen: false);
    globalInfo.setRole(Roles.consumer);
    // globalInfo.setRole(Roles.team);
    print(model.toString());
    Navigator.of(context).pushNamed('ConsumerHome');
    SharedPreferences.setMockInitialValues({"roleType": Roles.consumer});
  }

  void onCancel(model) {
    Navigator.of(context).pushNamed('/');
  }
}
