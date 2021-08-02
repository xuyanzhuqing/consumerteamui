import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'generated/l10n.dart';

import 'package:consumerteamui/consumer/themes/light.dart';
import 'package:consumerteamui/constants.dart';
import 'package:consumerteamui/store/globalInfo.dart';

import 'package:consumerteamui/consumer/router.dart' show consumerRoute;
import 'package:consumerteamui/team/router.dart' show teamRoutes;

class App extends StatelessWidget {
  const App({
    required Key key,
    required this.initialRoute,
    this.isTestMode = false,
  }) : super(key: key);

  final bool isTestMode;
  final String initialRoute;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<GlobalInfo>(create: (_) => GlobalInfo(
          themeMode: ThemeMode.system,
          textScaleFactor: systemTextScaleFactorOption,
          timeDilation: 100.0,
          platform: defaultTargetPlatform,
          isTestMode: isTestMode,
          locale: defaultLanguage
        )),
      ],
      child: Builder(builder: (context) {
        return MaterialApp(
          onGenerateTitle: (context) => S.of(context).title,
          restorationScopeId: 'consumerTeam',
          title: APP_NAME,
          debugShowCheckedModeBanner: false,
          theme: ConsumerLightTheme.innerthemeData.copyWith(
            platform: context.read<GlobalInfo>().platform
          ),
          localizationsDelegates: [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          locale: context.read<GlobalInfo>().locale,
          localeResolutionCallback: (Locale? locale, Iterable<Locale> supportedLocales) {
            var result = supportedLocales
                .where((element) => element.languageCode == locale?.languageCode);
            if (result.isNotEmpty) {
              return locale;
            }
            return defaultLanguage;
          },
          supportedLocales: S.delegate.supportedLocales,
          routes: consumerRoute,
          initialRoute: initialRoute,
          // onGenerateRoute: onGenerateRoute
        );
      })
    );
  }
}
