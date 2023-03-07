import 'package:concepta/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CoreShimmer extends StatelessWidget with CoreThemeDataMixin {
  const CoreShimmer({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final currentPrimaryColor = getThemedColor(context, CoreColorType.primary);
    final currentLoaderHighlightColor =
        getThemedColor(context, CoreColorType.loaderHighlight);
    return Shimmer.fromColors(
      baseColor: currentLoaderHighlightColor,
      highlightColor: currentPrimaryColor,
      child: child,
    );
  }
}
