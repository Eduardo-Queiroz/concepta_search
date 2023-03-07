import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class CoreStaggeredWrapper extends StatelessWidget {
  const CoreStaggeredWrapper({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: child,
    );
  }
}
