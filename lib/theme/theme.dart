import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'components/color_scheme_theme.dart';
import 'components/core_border_theme.dart';
import 'components/core_color_theme.dart';
import 'components/core_icon_size_theme.dart';
import 'components/core_loader_theme.dart';
import 'components/core_spacing_theme.dart';
import 'components/core_typography_theme.dart';
import 'components/input_decoration_theme.dart';
import 'components/text_selection_theme.dart';
import 'components/text_theme.dart';
import 'util/theme_constants.dart';

export './util/core_theme_data_mixin.dart';
export './types/themes.dart';
export './types/themes.dart';

class CoreThemeData extends ChangeNotifier {
  ThemeData get theme {
    return ThemeData(
      fontFamily: GoogleFonts.inter().fontFamily,
      dividerColor: CoreColorScheme().primary,
      inputDecorationTheme: inputDecorationTheme,
      scaffoldBackgroundColor: CoreColorScheme().background,
      colorScheme: colorSchemeTheme,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      textSelectionTheme: textSelectionTheme,
      textTheme: textTheme,
      extensions: <ThemeExtension<dynamic>>{
        coreTypographyTheme,
        coreSpacingTheme,
        coreIconTheme,
        coreBorderTheme,
        coreColorTheme,
        coreLoaderTheme,
      },
    );
  }
}
