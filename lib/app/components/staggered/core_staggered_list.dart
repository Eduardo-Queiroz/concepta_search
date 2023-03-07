import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class CoreStaggeredList extends StatelessWidget {
  const CoreStaggeredList({
    required this.child,
    required this.index,
    super.key,
  });

  final Widget child;
  final int index;

  @override
  Widget build(BuildContext context) {
    return AnimationConfiguration.staggeredList(
      position: index,
      duration: const Duration(milliseconds: 450),
      child: SlideAnimation(
        verticalOffset: 3.0,
        child: FadeInAnimation(
          curve: Curves.decelerate,
          child: child,
        ),
      ),
    );
  }
}
