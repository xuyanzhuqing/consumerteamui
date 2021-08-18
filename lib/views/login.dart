import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:consumerteamui/components/my_form/my_form.dart';

class Login extends StatefulWidget {
  @override
  _Login createState() => _Login();
}
class _Login extends State<Login> {
  GlobalKey formKey= new GlobalKey<FormState>();

  Map<String, dynamic> _model = {
    "user": "",
    "password": ""
  };

  @override
  Widget build(BuildContext context) {
    List<MyFormItem> items = [
      MyFormItem<String>(
        prop: "user",
        label: "用户名/手机号",
        initalValue: _model['user'],
        which: Which.char,
        rules: MultiValidator([
          RequiredValidator(errorText: '用户名/手机号不能为空'),
        ])
      ),
      MyFormItem<String>(
          prop: "password",
          initalValue: _model['password'] as String,
          label: "密码",
          which: Which.char,
          rules: MultiValidator([
            RequiredValidator(errorText: '密码不能为空'),
          ])
      ),
    ];

    return MyForm(
      formKey: formKey,
      title: "登陆",
      items: items,
      onFiledChange: onFiledChange,
      onSubmit: onSubmit,
      submitLabel: '登陆',
      cancelLabel: '注册',
      onCancel: onCancel
    );
  }

  void onFiledChange (String key, dynamic value) {
    print('------------');
    print(key);
    print(value);
  }

  void onSubmit (model) {
    print(model.toString());
  }

  void onCancel (model) {
    // Navigator.of(context).pushNamed('register');
    Navigator.of(context).pushNamed('consumerHome');
  }
}