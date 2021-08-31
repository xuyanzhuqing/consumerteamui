import 'package:consumerteamui/store/globalInfo.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:consumerteamui/enum/biz.dart' show Roles;
import 'dart:ui';

class Entry extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return Scaffold(
          body: Builder(
            builder: (BuildContext context) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Text(S.of(context).sys_warning),
                  toEntry(context, Roles.consumer, '注册用户'),
                  toEntry(context, Roles.team, '注册团长'),
                  MaterialButton(onPressed: (){
                    GlobalInfo globalInfo = Provider.of<GlobalInfo>(context, listen: false);
                    globalInfo.setRole(Roles.team);
                    Navigator.pushNamed(context, 'TeamHome');
                  }, child: Text('开团页面'),),
                  Container(
                      padding: EdgeInsets.all(16.0),
                      child: RichText(
                          text: TextSpan(
                              style: DefaultTextStyle.of(context).style,
                              children: [
                            TextSpan(text: '我已有账号，直接'),
                            TextSpan(
                              text: '登陆',
                              style: TextStyle(color: Colors.blueAccent),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.of(context).pushNamed('Login');
                                },
                            )
                          ])))
                ],
              );
            },
          ),
        );
      },
    );
  }

  Widget toEntry(BuildContext context, Roles roleType, String desc) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      child: Container(
        width: double.infinity,
        height: 100.0,
        margin: const EdgeInsets.all(10),
        alignment: Alignment.center,
        child: Text(
          desc,
          style: TextStyle(color: Colors.white),
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            color: Theme.of(context).colorScheme.primary,
            boxShadow: [
              //卡片阴影
              BoxShadow(
                  color: Colors.black54,
                  offset: Offset(2.0, 2.0),
                  blurRadius: 4.0)
            ]),
      ),
      onTap: () {
        // 切换身份
        GlobalInfo globalInfo = Provider.of<GlobalInfo>(context, listen: false);
        globalInfo.setRole(roleType);
        print(context.read<GlobalInfo>().routes.keys);
        // 传入角色类型
        Navigator.of(context)
            .pushNamed('Register', arguments: {roleType: roleType});
      },
    );
  }
}
