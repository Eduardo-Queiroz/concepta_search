import 'package:flutter/material.dart';

import '../theme.dart';

mixin CoreThemeDataMixin {
  Color getThemedColor(BuildContext context, CoreColorType color) =>
      Theme.of(context).extension<CoreColorTheme>()!.values[color]!;
}
