import 'package:flutter/material.dart';

import 'themes.dart';

class CoreLoaderThemeData {
  CoreLoaderThemeData({
    required this.size,
    required this.strokeWidth,
    required this.colorType,
  });

  final double size;
  final double strokeWidth;
  final CoreColorType colorType;
}

class CoreLoaderTheme extends ThemeExtension<CoreLoaderTheme>
    with MapperThemeBehavior<CoreLoaderTheme> {
  CoreLoaderTheme({
    required this.value,
  });

  final CoreLoaderThemeData value;
}
