import 'package:flutter/cupertino.dart';
import 'package:matcher/matcher.dart';


class Info extends StatefulWidget {
  Info({Key? key}) : super(key: key);

  @override
  _InfoState createState() => _InfoState();
}

class _InfoState extends State<Info> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Text("Info"),
    );
  }
}