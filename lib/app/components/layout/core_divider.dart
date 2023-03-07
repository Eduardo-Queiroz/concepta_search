import 'package:flutter/material.dart';
import 'package:concepta/theme/theme.dart';

class CoreDivider extends StatelessWidget with CoreThemeDataMixin {
  const CoreDivider({super.key});

  @override
  Widget build(BuildContext context) {
    final currentColor = getThemedColor(context, CoreColorType.primary);
    return Container(height: 1, color: currentColor);
  }
}
