import 'package:flutter/material.dart';

class TakePage extends StatefulWidget {
  TakePage({Key? key}) : super(key: key);

  @override
  _TakePageState createState() => _TakePageState();
}

class _TakePageState extends State<TakePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      title: Text("TakePage"),
    ));
  }
}
