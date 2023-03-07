import 'package:flutter/material.dart';
import 'package:concepta/theme/theme.dart';

class CoreSpacing {
  const CoreSpacing({
    CoreSpacingType? all,
    CoreSpacingType? horizontal,
    CoreSpacingType? vertical,
    CoreSpacingType? top,
    CoreSpacingType? bottom,
    CoreSpacingType? left,
    CoreSpacingType? right,
  })  : all = all ?? CoreSpacingType.spacing0,
        horizontal = all ?? horizontal ?? CoreSpacingType.spacing0,
        vertical = all ?? vertical ?? CoreSpacingType.spacing0,
        top = all ?? vertical ?? top ?? CoreSpacingType.spacing0,
        bottom = all ?? vertical ?? bottom ?? CoreSpacingType.spacing0,
        left = all ?? horizontal ?? left ?? CoreSpacingType.spacing0,
        right = all ?? horizontal ?? right ?? CoreSpacingType.spacing0;

  final CoreSpacingType all;
  final CoreSpacingType horizontal;
  final CoreSpacingType vertical;
  final CoreSpacingType left;
  final CoreSpacingType right;
  final CoreSpacingType top;
  final CoreSpacingType bottom;
}

class CoreContainer extends StatelessWidget with CoreThemeDataMixin {
  const CoreContainer({
    super.key,
    this.child,
    this.margin,
    this.padding,
    this.visible = true,
    this.color,
    this.alignment,
    this.width,
    this.height,
    this.border = CoreBorderType.none,
  });

  const CoreContainer.card({
    super.key,
    this.child,
    this.margin,
    this.padding,
    this.alignment,
    this.width,
    this.height,
    this.visible = true,
    this.color = CoreColorType.surface,
    this.border = CoreBorderType.curve,
  });

  final AlignmentGeometry? alignment;
  final double? width;
  final double? height;
  final CoreColorType? color;
  final CoreSpacing? padding;
  final CoreSpacing? margin;
  final bool visible;
  final CoreBorderType border;

  final Widget? child;

  EdgeInsetsGeometry? getPadding(BuildContext context) {
    if (padding != null) {
      final left = Theme.of(context)
              .extension<CoreSpacingTheme>()!
              .values[padding!.left] ??
          0.0;
      final top = Theme.of(context)
              .extension<CoreSpacingTheme>()!
              .values[padding!.top] ??
          0.0;
      final right = Theme.of(context)
              .extension<CoreSpacingTheme>()!
              .values[padding!.right] ??
          0.0;
      final bottom = Theme.of(context)
              .extension<CoreSpacingTheme>()!
              .values[padding!.bottom] ??
          0.0;
      return EdgeInsets.fromLTRB(left, top, right, bottom);
    }
    return null;
  }

  EdgeInsetsGeometry? getMargin(BuildContext context) {
    if (margin != null) {
      final left = Theme.of(context)
              .extension<CoreSpacingTheme>()!
              .values[margin!.left] ??
          0.0;
      final top = Theme.of(context)
              .extension<CoreSpacingTheme>()!
              .values[margin!.top] ??
          0.0;
      final right = Theme.of(context)
              .extension<CoreSpacingTheme>()!
              .values[margin!.right] ??
          0.0;
      final bottom = Theme.of(context)
              .extension<CoreSpacingTheme>()!
              .values[margin!.bottom] ??
          0.0;
      return EdgeInsets.fromLTRB(left, top, right, bottom);
    }
    return null;
  }

  Decoration? getDecoration(BuildContext context) {
    BoxDecoration boxDecoration = const BoxDecoration();

    final currentColor = getThemedColor(
      context,
      color ?? CoreColorType.background,
    );

    if (color != null) {
      boxDecoration = boxDecoration.copyWith(
        color: currentColor,
      );
    }

    if (border != CoreBorderType.none) {
      final currentBorderColor = getThemedColor(context, CoreColorType.primary);

      final currentBorder =
          Theme.of(context).extension<CoreBorderTheme>()!.values[border]!;

      boxDecoration = boxDecoration.copyWith(
        borderRadius: BorderRadius.all(
          Radius.circular(currentBorder.radius),
        ),
        border: Border.all(
          width: currentBorder.width,
          color: currentBorderColor,
        ),
      );
    }

    return boxDecoration;
  }

  @override
  Widget build(BuildContext context) {
    return visible
        ? Container(
            decoration: getDecoration(context),
            padding: getPadding(context),
            margin: getMargin(context),
            alignment: alignment,
            width: width,
            height: height,
            child: child,
          )
        : const SizedBox.shrink();
  }
}
