// 商品 list 组建
import 'package:flutter/material.dart';

class GoodItem {
  static String imgBaseUrl = 'https://meishi.0513.org';

  static Widget itemBuilder(int index) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.0),
      child: Row(
        children: [
          Expanded(
              child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.all(
                const Radius.circular(8),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.only(right: 8.0),
                    child: bannerImage(
                        '/doupload/block/2018-06/1530093681_1516.jpg'),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      labelWidthText('订单号', index.toString()),
                      labelWidthText('总金额', '\$133.6'),
                      labelWidthText('状态', '待支付'),
                      labelWidthText('订购日期', '2021-7-25'),
                    ],
                  )
                ],
              ),
            ),
          )),
          Container(
              width: 100.0,
              child: Column(
                children: [
                  userImage('/doupload/block/2018-06/1530093681_1516.jpg'),
                  Text('michael', style: TextStyle(color: Colors.grey)),
                  ElevatedButton(
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                    ),
                    child: Text('联系团长'),
                    onPressed: () {},
                  )
                ],
              ))
        ],
      ),
    );
  }

  static FadeInImage bannerImage(String path) {
    return FadeInImage.assetNetwork(
      placeholder: 'assets/images/icons8-loading-circle.gif',
      placeholderScale: 0.5,
      image: "$imgBaseUrl/$path",
      width: 100.0,
    );
  }

  static Image userImage(String path) {
    return Image(
        image: AssetImage("assets/images/icons8-user-64.png"), width: 36);
  }

  static Widget labelWidthText(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(label + ':  '),
        Text(value, style: TextStyle(color: Colors.grey)),
      ],
    );
  }
}
