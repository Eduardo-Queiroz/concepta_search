import 'package:flutter/material.dart';
import 'package:concepta/theme/theme.dart';

class CoreTypography extends StatelessWidget {
  const CoreTypography(
    this.content, {
    this.type,
    this.textAlign = TextAlign.left,
    this.color = CoreColorType.primary,
    super.key,
  });

  const CoreTypography.headline(
    this.content, {
    this.type = CoreTextType.headline,
    this.textAlign = TextAlign.left,
    this.color = CoreColorType.primary,
    super.key,
  });

  const CoreTypography.bodyText1(
    this.content, {
    this.type = CoreTextType.bodyText1,
    this.textAlign = TextAlign.left,
    this.color = CoreColorType.primary,
    super.key,
  });

  const CoreTypography.bodyText2(
    this.content, {
    this.type = CoreTextType.bodyText2,
    this.textAlign = TextAlign.left,
    this.color = CoreColorType.primary,
    super.key,
  });

  const CoreTypography.caption(
    this.content, {
    this.type = CoreTextType.caption,
    this.textAlign = TextAlign.left,
    this.color = CoreColorType.primary,
    super.key,
  });

  //custom style
  final CoreTextType? type;
  final TextAlign? textAlign;
  final String content;
  final CoreColorType? color;

  TextStyle _getThemedStyle(BuildContext context) {
    final currentColor =
        Theme.of(context).extension<CoreColorTheme>()!.values[color]!;

    final currentStyle =
        Theme.of(context).extension<CoreTypographyTheme>()!.values[type] ??
            const TextStyle();

    return currentStyle.copyWith(
      color: currentColor,
    );
  }

  @override
  Widget build(BuildContext context) {
    final currentStyle = _getThemedStyle(context);
    return Text(content, style: currentStyle, textAlign: textAlign);
  }
}
