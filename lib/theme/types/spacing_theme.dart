import 'package:flutter/material.dart';

import 'themes.dart';

enum CoreSpacingType {
  spacing0,
  spacing25,
  spacing50,
  spacing100,
  spacing150,
  spacing200,
  spacing300,
  spacing400,
  spacing500,
  spacing600,
  spacing700,
  spacing800,
}

class CoreSpacingTheme extends ThemeExtension<CoreSpacingTheme>
    with MapperThemeBehavior<CoreSpacingTheme> {
  CoreSpacingTheme({
    required this.values,
  });

  final Map<CoreSpacingType, double> values;
}
