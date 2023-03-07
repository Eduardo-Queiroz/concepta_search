import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'app/features/details/infra/routes/details.dart';
import 'app/features/search/infra/routes/search.dart';
import 'app/shared/router.dart';
import 'theme/theme.dart';

class App extends StatefulWidget {
  @override
  AppState createState() => AppState();
}

class AppState extends State<App> {
  final GlobalKey _appKey = GlobalKey();
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey();
  final CoreThemeData customTheme = CoreThemeData();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      key: _appKey,
      debugShowCheckedModeBanner: false,
      title: 'Nike',
      theme: customTheme.theme,
      onGenerateRoute: (settings) {
        return Routes.routeMap[settings.name]!.createRoute(settings);
      },
      localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: const <Locale>[
        Locale('pt', 'BR'),
      ],
      initialRoute: SearchRoute.path,
      navigatorKey: _navigatorKey,
    );
  }
}
