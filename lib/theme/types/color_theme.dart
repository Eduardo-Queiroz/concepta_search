import 'package:flutter/material.dart';

import 'themes.dart';

enum CoreColorType {
  primary,
  secondary,
  background,
  surface,
  error,
  loaderHighlight,
}

class CoreColorTheme extends ThemeExtension<CoreColorTheme>
    with MapperThemeBehavior<CoreColorTheme> {
  CoreColorTheme({
    required this.values,
  });

  final Map<CoreColorType, Color> values;
}
