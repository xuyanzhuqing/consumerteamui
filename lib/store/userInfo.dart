import 'package:flutter/foundation.dart';
import 'package:consumerteamui/models/sys_user.dart';

class UserInfo with ChangeNotifier, DiagnosticableTreeMixin {
  UserInfo({
    required this.user
  });

  final SysUser user;

  // DateTime loginTime = 
}