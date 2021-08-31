// https://pub.flutter-io.cn/packages/url_launcher
import 'package:url_launcher/url_launcher.dart';

class MyUrlLauncher {
  // 打电话
  static void launchPhone(String phone,
      {String countryCode = '+86', scheme = 'tel'}) async {
    String url = '$scheme:$countryCode$phone';
    await canLaunch(url)
        ? await launch(url)
        : throw 'Could not launch phone $phone';
  }

  // 发邮件
  static void launchEmail(String path, Map<String, String> query,
      {scheme = 'mailto'}) async {
    final Uri emailLaunchUri = Uri(
      scheme: scheme,
      path: path,
      query: encodeQueryParameters(query),
    );

    await canLaunch(emailLaunchUri.toString())
        ? await launch(emailLaunchUri.toString())
        : throw 'Could not launch email $path';
  }
}

// 拼接参数
String? encodeQueryParameters(Map<String, String> params) {
  return params.entries
      .map((e) =>
          '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
      .join('&');
}
