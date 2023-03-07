// ignore_for_file: library_private_types_in_public_api

library animated_rotation;

import 'dart:math' show pi;

import 'package:concepta/infra/util/animation_constants.dart';
import 'package:flutter/widgets.dart';

/// Animated version of [Transform.rotate] which automatically transitions the
/// rotation over time.
class CoreAnimatedRotation extends ImplicitlyAnimatedWidget {
  /// Creates a widget that rotates its child by a value that animates
  /// implicitly.
  ///
  /// The [angle], [curve], and [duration] arguments must not be null.
  const CoreAnimatedRotation({
    super.key,
    required this.angle,
    required this.child,
    super.curve = Curves.linear,
    required super.duration,
  });

  /// The amount degrees to rotate the child clockwise.
  final double angle;

  /// The widget to rotate
  final Widget child;

  @override
  _AnimatedRotationState createState() => _AnimatedRotationState();
}

class _AnimatedRotationState
    extends AnimatedWidgetBaseState<CoreAnimatedRotation> {
  Tween<num>? _angle;

  num _degToRad(num deg) => deg * (pi / 180.0);

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    _angle = visitor(_angle, widget.angle,
        (dynamic value) => Tween<num>(begin: value as num)) as Tween<num>?;
  }

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: _degToRad(_angle!.evaluate(animation)).toDouble(),
      child: widget.child,
    );
  }
}
