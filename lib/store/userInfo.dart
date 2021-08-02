import 'package:flutter/foundation.dart';
import 'package:consumerteamui/models/user.dart';

class UserInfo with ChangeNotifier, DiagnosticableTreeMixin {
  UserInfo({
    required this.user
  });

  final User user;

  // DateTime loginTime = 
}