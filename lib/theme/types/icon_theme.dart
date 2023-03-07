import 'package:flutter/material.dart';

import 'themes.dart';

enum CoreIconSizeType {
  none,
  small,
  medium,
}

class CoreIconSizeTheme extends ThemeExtension<CoreIconSizeTheme>
    with MapperThemeBehavior<CoreIconSizeTheme> {
  CoreIconSizeTheme({
    required this.values,
  });

  final Map<CoreIconSizeType, double> values;
}
