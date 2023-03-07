import 'package:flutter/material.dart';

import 'themes.dart';

enum CoreTextType {
  headline,
  bodyText1,
  bodyText2,
  caption,
}

class CoreTypographyTheme extends ThemeExtension<CoreTypographyTheme>
    with MapperThemeBehavior<CoreTypographyTheme> {
  CoreTypographyTheme(this.values);

  final Map<CoreTextType, TextStyle> values;
}
