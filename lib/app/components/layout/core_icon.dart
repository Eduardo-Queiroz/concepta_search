import 'package:flutter/material.dart';
import 'package:concepta/theme/theme.dart';

class CoreIcon extends StatelessWidget with CoreThemeDataMixin {
  const CoreIcon({
    super.key,
    required this.icon,
    required this.iconSize,
    this.color = CoreColorType.primary,
  });

  const CoreIcon.small({
    super.key,
    required this.icon,
    this.iconSize = CoreIconSizeType.small,
    this.color = CoreColorType.primary,
  });

  const CoreIcon.medium({
    super.key,
    required this.icon,
    this.iconSize = CoreIconSizeType.medium,
    this.color = CoreColorType.primary,
  });

  final CoreColorType color;
  final CoreIconSizeType? iconSize;
  final IconData icon;

  double? _getThemedStyle(BuildContext context) {
    return Theme.of(context).extension<CoreIconSizeTheme>()!.values[iconSize];
  }

  @override
  Widget build(BuildContext context) {
    final currentColor = getThemedColor(context, color);
    final iconSize = _getThemedStyle(context);
    return Icon(icon, color: currentColor, size: iconSize);
  }
}
