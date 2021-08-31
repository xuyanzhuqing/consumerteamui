import 'package:flutter/cupertino.dart';
import 'package:matcher/matcher.dart';


class Shopping extends StatefulWidget {
  Shopping({Key? key}) : super(key: key);

  @override
  _ShoppingState createState() => _ShoppingState();
}

class _ShoppingState extends State<Shopping> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Text("Shopping"),
    );
  }
}