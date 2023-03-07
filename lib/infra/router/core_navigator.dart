import 'package:flutter/material.dart';

import 'route_provider.dart';

class CoreNavigator {
  CoreNavigator.of(this.context) : flutterNavigator = Navigator.of(context);

  final BuildContext context;

  final NavigatorState flutterNavigator;

  void pushNamed(CoreRoute route) {
    flutterNavigator.pushNamed(route.getPath, arguments: route);
  }

  @optionalTypeArgs
  void pop<T extends Object?>([T? result]) {
    flutterNavigator.pop<T>(result);
  }
}
