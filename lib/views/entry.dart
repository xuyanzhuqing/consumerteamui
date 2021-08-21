import 'package:consumerteamui/store/globalInfo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:consumerteamui/enum/biz.dart' show Roles;
import 'package:consumerteamui/views/login.dart';

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
                  toEntry(context, Roles.team, '我是团长', 'TeamHome'),
                  toEntry(context, Roles.consumer, '我是消费者', 'ConsumerHome')
                ],
              );
            },
          ),
        );
        // return Login();
      },
    );
  }

  Widget toEntry(
      BuildContext context, Roles roleType, String desc, String route) {
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
            color: Theme.of(context).colorScheme.primaryVariant,
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
        Navigator.of(context).pushNamed(route);
      },
    );
  }
}
