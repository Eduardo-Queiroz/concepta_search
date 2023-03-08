import 'package:concepta/infra/util/animation_constants.dart';
import 'package:flutter/material.dart';

class CoreShimmerWrapper extends StatelessWidget {
  final Widget shimmer;
  final Widget body;
  final bool isLoading;

  const CoreShimmerWrapper({
    super.key,
    required this.shimmer,
    required this.body,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: CoreDelay().quick,
      transitionBuilder: (
        Widget child,
        Animation<double> animation,
      ) =>
          FadeTransition(opacity: animation, child: child),
      child: isLoading ? shimmer : body,
    );
  }
}
