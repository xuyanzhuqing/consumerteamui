import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:shake_animation_widget/shake_animation_widget.dart';

typedef VoidFunc = void Function(MyFormItemInner item);

enum Which {
  char,
  button
}

enum MyButtonStyle {
  primary,
  outline
}

class MyFormItem {
  MyFormItem({
    required this.prop,
    this.label,
    required this.which,
    this.decoration,
    this.rules,
    this.gap = 20,
    this.buttonStyle = MyButtonStyle.primary
  });

  final String prop;
  final String? label;
  final Which which;
  final InputDecoration? decoration;
  final MultiValidator? rules;
  final double gap;
  final MyButtonStyle buttonStyle;

  static Widget buildButton (MyButtonStyle buttonStyle, String label, Function pressed) {
    ButtonStyleButton button =
      buttonStyle == MyButtonStyle.primary
        ? ElevatedButton(child: Text(label),onPressed: () => pressed())
        : OutlinedButton(child: Text(label),onPressed: () => pressed());

    return Container(
      width: double.infinity,
      height: 40,
      child: button
    );
  }
}

class MyFormItemInner {
  MyFormItemInner({
    required this.myFormItem,
    required this.focusNode,
    required this.textEditingController,
    required this.shakeAnimationController,
    required this.streamController,
  });
  MyFormItem myFormItem;

  //用户名输入框的焦点控制
  FocusNode focusNode;

  //文本输入框控制器
  TextEditingController textEditingController;

  //抖动动画控制器
  ShakeAnimationController shakeAnimationController;

  //Stream 更新操作控制器
  StreamController<String> streamController;
}