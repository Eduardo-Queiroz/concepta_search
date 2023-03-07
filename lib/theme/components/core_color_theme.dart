import 'package:flutter/material.dart';
import '../types/color_theme.dart';
import '../util/theme_constants.dart';

final coreColorTheme = CoreColorTheme(
  values: <CoreColorType, Color>{
    CoreColorType.primary: CoreColorScheme().primary,
    CoreColorType.secondary: CoreColorScheme().secondary,
    CoreColorType.background: CoreColorScheme().background,
    CoreColorType.surface: CoreColorScheme().surface,
    CoreColorType.error: CoreColorScheme().error,
    CoreColorType.loaderHighlight: CoreColorScheme().loaderHighlight,
  },
);
