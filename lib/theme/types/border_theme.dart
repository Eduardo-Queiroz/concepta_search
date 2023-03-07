import 'package:flutter/material.dart';

import 'themes.dart';

enum CoreBorderType {
  none,
  easy,
  curve,
  circular,
}

class CoreBorderThemeData {
  CoreBorderThemeData({
    required this.width,
    required this.radius,
  });

  final double width;
  final double radius;
}

class CoreBorderTheme extends ThemeExtension<CoreBorderTheme>
    with MapperThemeBehavior<CoreBorderTheme> {
  CoreBorderTheme({
    required this.values,
  });

  final Map<CoreBorderType, CoreBorderThemeData> values;
}
