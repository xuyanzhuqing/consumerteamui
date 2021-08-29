import 'package:flutter/cupertino.dart';
import 'package:matcher/matcher.dart';

class About extends StatefulWidget {
  About({Key? key}) : super(key: key);

  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("About"),
    );
  }
}
