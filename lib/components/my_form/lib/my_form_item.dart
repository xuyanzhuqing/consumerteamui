import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:consumerteamui/components/shake_animation_widget/shake_animation_widget.dart';

typedef VoidFunc = void Function(MyFormItemInner item);

enum Which {
  char,
  button
}

enum MyButtonStyle {
  primary,
  outline
}

class MyFormItem<T> {
  MyFormItem({
    required this.prop,
    this.initalValue,
    this.label,
    required this.which,
    this.decoration,
    this.rules,
    this.gap = 20,
    this.buttonStyle = MyButtonStyle.primary
  });

  final String prop;
  final T? initalValue;
  final String? label;
  final Which which;
  final InputDecoration? decoration;
  final MultiValidator? rules;
  final double gap;
  final MyButtonStyle buttonStyle;

  static Widget buildButton (String? label, Function pressed, { MyButtonStyle? buttonStyle = MyButtonStyle.primary } ) {
    ButtonStyleButton button =
      buttonStyle == MyButtonStyle.primary
        ? ElevatedButton(child: Text(label??''),onPressed: () => pressed())
        : OutlinedButton(child: Text(label??''),onPressed: () => pressed());

    return Container(
      width: double.infinity,
      height: 40,
      child: button
    );
  }

   @override
  bool operator == (Object other) => identical(this, other)
    || other is MyFormItem && prop == other.prop && initalValue == other.initalValue && label == this.label && which == other.which && decoration == other.decoration && rules == other.rules && gap == other.gap && buttonStyle == other.buttonStyle;

  @override
  int get hashCode => prop.hashCode ^ initalValue.hashCode ^ label.hashCode ^ which.hashCode ^ decoration.hashCode ^ rules.hashCode ^ gap.hashCode ^ buttonStyle.hashCode;
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

  MyFormItemInner copyWith({
    MyFormItem? myFormItem,
    TextEditingController? textEditingController,
    ShakeAnimationController? shakeAnimationController,
    StreamController<String>? streamController,
  }) => MyFormItemInner(
    myFormItem: myFormItem ?? this.myFormItem,
    focusNode: focusNode,
    textEditingController: textEditingController ?? this.textEditingController,
    shakeAnimationController: shakeAnimationController ?? this.shakeAnimationController,
    streamController: streamController ?? this.streamController
  );
}