import 'package:flutter/material.dart';
import 'package:consumerteamui/consumer/components/good-item.dart';

class PaidDetail extends StatefulWidget {
  @override
  State<PaidDetail> createState() => _PaidDetail();
}

class _PaidDetail extends State<PaidDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("待支付订单"),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            GoodItem.itemBuilder(
              0,
              () => {},
            ),
            SizedBox(
              height: 16.0,
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: 20,
                  itemBuilder: (BuildContext context, int index) {
                    return GoodItem.goodDetail(
                      index,
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
