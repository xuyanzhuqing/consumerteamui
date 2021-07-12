// 全局信息存储
import 'package:consumerteamui/generated/l10n.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:consumerteamui/constants.dart';
import 'package:flutter/services.dart' show SystemUiOverlayStyle;

const defaultLanguage = Locale('zh');

class GlobalInfo with ChangeNotifier, DiagnosticableTreeMixin {
   GlobalInfo({
    required this.themeMode,
    required double textScaleFactor,
    required Locale locale,
    required this.timeDilation,
    required this.platform,
    required this.isTestMode,
  })  : _textScaleFactor = textScaleFactor,
        _locale = locale;

  final ThemeMode themeMode;
  final double _textScaleFactor;
  Locale _locale;
  final double timeDilation;
  final TargetPlatform platform;
  final bool isTestMode;

  // 默认跟随系统字体
  double textScaleFactor(BuildContext context, {bool useSentinel = false}) {
    if (_textScaleFactor == systemTextScaleFactorOption) {
      return useSentinel
          ? systemTextScaleFactorOption
          : MediaQuery.of(context).textScaleFactor;
    } else {
      return _textScaleFactor;
    }
  }

  Locale get locale => _locale;

  void setLocale (Locale newLocale) {
     // 加载实例
    _locale = newLocale;
    S.load(newLocale);
    notifyListeners();
  }

  /// Returns a [SystemUiOverlayStyle] based on the [ThemeMode] setting.
  /// In other words, if the theme is dark, returns light; if the theme is
  /// light, returns dark.
  SystemUiOverlayStyle resolvedSystemUiOverlayStyle() {
    Brightness brightness;
    switch (themeMode) {
      case ThemeMode.light:
        brightness = Brightness.light;
        break;
      case ThemeMode.dark:
        brightness = Brightness.dark;
        break;
      default:
        brightness = WidgetsBinding.instance?.window.platformBrightness ?? Brightness.light;
    }

    final overlayStyle = brightness == Brightness.dark
        ? SystemUiOverlayStyle.light
        : SystemUiOverlayStyle.dark;

    return overlayStyle;
  }

  GlobalInfo copyWith({
    ThemeMode? themeMode,
    double? textScaleFactor,
    Locale? locale,
    double? timeDilation,
    TargetPlatform? platform,
    bool? isTestMode,
  }) {
    return GlobalInfo(
      themeMode: themeMode ?? this.themeMode,
      textScaleFactor: textScaleFactor ?? _textScaleFactor,
      locale: locale ?? this.locale,
      timeDilation: timeDilation ?? this.timeDilation,
      platform: platform ?? this.platform,
      isTestMode: isTestMode ?? this.isTestMode,
    );
  }

  @override
  bool operator ==(Object other) =>
      other is GlobalInfo &&
      themeMode == other.themeMode &&
      _textScaleFactor == other._textScaleFactor &&
      locale == other.locale &&
      timeDilation == other.timeDilation &&
      platform == other.platform &&
      isTestMode == other.isTestMode;

  @override
  int get hashCode => hashValues(
    themeMode,
    _textScaleFactor,
    locale,
    timeDilation,
    platform,
    isTestMode,
  );

  // 用于开启dev 调试
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('isTestMode', isTestMode.toString()));
  }

  static void update(BuildContext context, GlobalInfo newModel) {

  }
}