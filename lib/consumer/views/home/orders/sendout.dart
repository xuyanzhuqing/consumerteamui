import 'package:flutter/material.dart';

class SendoutPage extends StatefulWidget {
  SendoutPage({Key? key}) : super(key: key);

  @override
  _SendoutPageState createState() => _SendoutPageState();
}

class _SendoutPageState extends State<SendoutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      title: Text("SendoutPage"),
    ));
  }
}
