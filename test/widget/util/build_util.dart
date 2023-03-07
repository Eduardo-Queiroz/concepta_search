import 'package:concepta/infra/router/route_provider.dart';
import 'package:concepta/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class BuildUtil {
  static Future<void> pumpTestableWidget(
    WidgetTester tester,
    Widget widget,
  ) async {
    const int width = 720;
    const int height = 960;
    tester.binding.window.devicePixelRatioTestValue = 2.625;
    tester.binding.window.platformDispatcher.textScaleFactorTestValue = 1.1;
    final double dpi = tester.binding.window.devicePixelRatio;
    tester.binding.window.physicalSizeTestValue =
        Size(width * dpi, height * dpi);
    await tester.pumpWidget(widget);
  }

  static Widget buildTestableWidget<ParametersType extends CoreRoute>(
    Widget widget, {
    List<SingleChildWidget> providers = const <SingleChildWidget>[],
  }) {
    List<SingleChildWidget> mergedProviders = <SingleChildWidget>[...providers];

    final Widget mockedWidget = mergedProviders.isNotEmpty
        ? MultiProvider(
            providers: mergedProviders,
            child: widget,
          )
        : widget;

    final CoreThemeData customTheme = CoreThemeData();

    return MediaQuery(
      data: const MediaQueryData(),
      child: MaterialApp(
        localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate
        ],
        supportedLocales: const <Locale>[Locale('pt', 'BR')],
        home: mockedWidget,
        theme: customTheme.theme,
      ),
    );
  }
}
