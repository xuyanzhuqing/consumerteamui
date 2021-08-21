import 'package:flutter/material.dart';

class ReceivingPage extends StatefulWidget {
  ReceivingPage({Key? key}) : super(key: key);

  @override
  _ReceivingPageState createState() => _ReceivingPageState();
}

class _ReceivingPageState extends State<ReceivingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      title: Text("ReceivingPage"),
    ));
  }
}
