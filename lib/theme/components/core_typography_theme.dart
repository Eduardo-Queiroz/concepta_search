import 'package:flutter/material.dart';
import '../theme.dart';
import '../util/theme_constants.dart';

final coreTypographyTheme = CoreTypographyTheme(
  <CoreTextType, TextStyle>{
    CoreTextType.headline: TextStyle(
      fontSize: CoreFontSize().headline,
      fontWeight: FontWeight.w700,
    ),
    CoreTextType.bodyText1: TextStyle(
      fontSize: CoreFontSize().bodyText1,
      fontWeight: FontWeight.w400,
    ),
    CoreTextType.bodyText2: TextStyle(
      fontSize: CoreFontSize().bodyText2,
      fontWeight: FontWeight.w400,
    ),
    CoreTextType.caption: TextStyle(
      fontSize: CoreFontSize().caption,
      fontWeight: FontWeight.w400,
    ),
  },
);
