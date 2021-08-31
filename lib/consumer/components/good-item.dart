// 商品 list 组建
import 'package:flutter/material.dart';
import 'package:consumerteamui/utils/my_url_launcher.dart';

class GoodItem {
  static String imgBaseUrl = 'https://meishi.0513.org';

  static Widget itemBuilder(int index, void Function() linkTo) {
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
                child: Container(
                  height: 80,
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: linkTo,
                        child: Container(
                          padding: EdgeInsets.only(right: 8.0),
                          child: bannerImage(
                            '/doupload/block/2018-06/1530093681_1516.jpg',
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          labelWidthText('订单号', index.toString()),
                          labelWidthText('总金额', '\$133.6'),
                          labelWidthText('订购日期', '2021-7-25'),
                        ],
                      )
                    ],
                  ),
                )),
          )),
          Container(
            width: 100.0,
            child: Column(
              children: [
                userImage('assets/images/icons8-user-64.png'),
                Text('michael', style: TextStyle(color: Colors.grey)),
                ElevatedButton(
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                  ),
                  child: Text('联系团长'),
                  onPressed: () {
                    MyUrlLauncher.launchPhone('17721452600',
                        countryCode: '+86');
                    // MyUrlLauncher.launchEmail('962275976@qq.com', {
                    //   'subject': 'Example Subject & Symbols are allowed!',
                    //   'body': '<p>this is a P for tes_t</p>'
                    // });
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  static Widget goodDetail(int index) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.only(right: 8.0),
          child: bannerImage(
            '/doupload/block/2018-06/1530093681_1516.jpg',
          ),
        ),
        Expanded(
          child: Column(
            children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('香辣小龙虾'),
                    Text('\$ 26'),
                  ],
                ),
                padding: EdgeInsets.all(16),
                margin: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                        // 设置单侧边框的样式
                        color: Colors.grey,
                        width: 3,
                        style: BorderStyle.solid),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('交付方式：团长提货'),
                  Text('购买数量  1'),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }

  static FadeInImage bannerImage(String path) {
    return FadeInImage.assetNetwork(
      placeholder: 'assets/images/icons8-loading-circle.gif',
      image: "$imgBaseUrl/$path",
      width: 100.0,
    );
  }

  static Image userImage(String path) {
    return Image(image: AssetImage(path), width: 36);
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
