import 'package:flutter/material.dart';

enum CorePageTransitionType {
  /// Fade Animation
  fade,

  /// Right to left with fading animation
  wave,
}

/// Page transition class compose for PageRouteBuilder
class CorePageTransition<T> {
  /// Page transition constructor. We can pass the next page as a child,
  const CorePageTransition({
    required this.type,
    this.context,
    this.inheritTheme = false,
    this.curve = Curves.ease,
    this.alignment,
    this.duration = const Duration(milliseconds: 900),
    this.reverseDuration = const Duration(milliseconds: 900),
    this.fullscreenDialog = false,
    this.opaque = false,
  });

  /// Transition types
  final CorePageTransitionType type;

  /// Curves for transitions
  final Curve curve;

  /// Alignment for transitions
  final Alignment? alignment;

  /// Duration for your transition default is 300 ms
  final Duration duration;

  /// Duration for your pop transition default is 300 ms
  final Duration reverseDuration;

  /// Context for inherit theme
  final BuildContext? context;

  /// Optional inherit theme
  final bool inheritTheme;

  /// Optional fullscreen dialog mode
  final bool fullscreenDialog;

  final bool opaque;

  PageRouteBuilder<T> provider(
    Widget child,
    RouteSettings? settings,
  ) =>
      PageRouteBuilder<T>(
        settings: settings,
        pageBuilder: (
          _,
          animation,
          secondaryAnimation,
        ) =>
            child,
        transitionDuration: duration,
        reverseTransitionDuration: reverseDuration,
        opaque: false,
        barrierDismissible: false,
        transitionsBuilder: (
          context,
          animation,
          secondaryAnimation,
          child,
        ) {
          switch (type) {
            case CorePageTransitionType.fade:
              return FadeTransition(opacity: animation, child: child);

            case CorePageTransitionType.wave:
              {
                var screenSize = MediaQuery.of(context).size;
                Offset center =
                    Offset(screenSize.width / 2, screenSize.height / 4 + 20);
                double beginRadius = 0.0;
                double endRadius = screenSize.height / 2;

                Tween tween = Tween(begin: beginRadius, end: endRadius);
                Animation radiusTweenAnimation = animation.drive(tween);

                return ClipPath(
                  clipper: CircleRevealClipper(
                    radius: radiusTweenAnimation,
                    center: center,
                  ),
                  child: child,
                );
              }

            default:
              return SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(1, 0),
                  end: Offset.zero,
                ).animate(animation),
                child: FadeTransition(
                  opacity: animation,
                  child: SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(1, 0),
                      end: Offset.zero,
                    ).animate(animation),
                    child: child,
                  ),
                ),
              );
          }
        },
      );
}

class CircleRevealClipper extends CustomClipper<Path> {
  final Offset center;
  final Animation radius;

  CircleRevealClipper({
    required this.center,
    required this.radius,
  });

  @override
  Path getClip(Size size) {
    return Path()
      ..addOval(Rect.fromCircle(radius: radius.value, center: center));
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
