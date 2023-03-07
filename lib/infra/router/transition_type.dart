import 'package:flutter/material.dart';

enum CorePageTransitionType {
  /// Fade Animation
  fade,
}

/// Page transition class compose for PageRouteBuilder
class CorePageTransition<T> {
  /// Page transition constructor. We can pass the next page as a child,
  const CorePageTransition({
    required this.type,
    this.context,
    this.inheritTheme = false,
    this.curve = Curves.linear,
    this.alignment,
    this.duration = const Duration(milliseconds: 600),
    this.reverseDuration = const Duration(milliseconds: 600),
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
            inheritTheme
                ? InheritedTheme.captureAll(
                    context!,
                    child,
                  )
                : child,
        transitionDuration: duration,
        reverseTransitionDuration: reverseDuration,
        opaque: opaque,
        fullscreenDialog: fullscreenDialog,
        transitionsBuilder: (
          _,
          animation,
          secondaryAnimation,
          child,
        ) {
          switch (type) {
            case CorePageTransitionType.fade:
              return FadeTransition(opacity: animation, child: child);

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
              ;
          }
        },
      );
}
