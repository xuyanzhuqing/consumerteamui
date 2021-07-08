import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:consumerteamui/consumer/views/home.dart';
import 'package:consumerteamui/team/views/home.dart';
import 'package:consumerteamui/store/globalInfo.dart';
import 'package:consumerteamui/consumer/themes/light.dart';
import 'package:consumerteamui/constants.dart';
import 'package:consumerteamui/utils/route.dart';

Map<String, Widget Function(BuildContext)> routes = {
  "ConsumerHome": (context) => ConsumerHome(),
  "TeamHome": (context) => TeamHome(),
  "/": (context) => AppEntry()
};

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
          customTextDirection: CustomTextDirection.localeBased,
          timeDilation: 100.0,
          platform: defaultTargetPlatform,
          isTestMode: isTestMode,
        ))
      ],
      child: Builder(builder: (context) {
        return MaterialApp(
          restorationScopeId: 'consumerTeam',
          title: APP_NAME,
          debugShowCheckedModeBanner: false,
          theme: ConsumerLightTheme.innerthemeData.copyWith(
            // platform: context.read<GlobalInfo>().platform // both ok
            platform: context.watch<GlobalInfo>().platform
          ),
          routes: routes,
          initialRoute: initialRoute,
          // onGenerateRoute: onGenerateRoute
        );
      })
    );
  }
}

class AppEntry extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('')
        ),
        body: Column(
          children: [
            // Text('${context.watch<GlobalInfo>().testState.toString()}'),
            openNamedRoute(context, routeName: 'TeamHome', text: '我是团长'),
            openNamedRoute(context, routeName: 'ConsumerHome', text: '我是消费者'),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          key: const Key('increment_floatingActionButton'),
          onPressed: () => context.read<GlobalInfo>().toggleState(),
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
      );
    },);
  }
}
