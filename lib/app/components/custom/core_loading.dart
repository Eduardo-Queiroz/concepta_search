import 'package:flutter/material.dart';
import 'package:concepta/theme/theme.dart';

import '../layout/core_container.dart';

class CoreLoading extends StatelessWidget with CoreThemeDataMixin {
  const CoreLoading({
    super.key,
    this.title = '',
    this.height = 80,
  });

  final String title;
  final double height;

  CoreLoaderThemeData _getThemedStyle(BuildContext context) {
    final currentStyle = Theme.of(context).extension<CoreLoaderTheme>()!.value;
    return currentStyle;
  }

  @override
  Widget build(BuildContext context) {
    final currentStyle = _getThemedStyle(context);
    final currentColor = getThemedColor(context, currentStyle.colorType);
    return CoreContainer(
      width: double.infinity,
      height: height,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CoreContainer(
              child: CircularProgressIndicator(
                strokeWidth: currentStyle.strokeWidth,
                valueColor: AlwaysStoppedAnimation<Color>(currentColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
