// 上下结构的 icon button
import 'package:flutter/material.dart';

class IconButton extends StatelessWidget {
  var Txt;
  var IconData;
  var goUrl;
  IconButton({
    Key? key,
    required this.Txt,
    required this.IconData,
    required this.goUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: new InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(goUrl);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            IconData,
            size: 35,
            color: Colors.brown,
          ),
          Container(
            padding: EdgeInsets.only(top: 5),
            child: Text(
              Txt,
              style: TextStyle(color: Colors.brown, fontSize: 14),
            ),
          )
        ],
      ),
    ));
  }
}
