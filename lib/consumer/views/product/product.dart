import 'package:flutter/cupertino.dart';
import 'package:matcher/matcher.dart';


class Product extends StatefulWidget {
  Product({Key? key}) : super(key: key);

  @override
  _ProductState createState() => _ProductState();
}

class _ProductState extends State<Product> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Text("Product"),
    );
  }
}