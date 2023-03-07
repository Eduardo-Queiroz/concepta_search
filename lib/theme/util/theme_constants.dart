import 'package:flutter/material.dart';

class CoreIconSize {
  double get none => 0.0;
  double get small => 16.0;
  double get medium => 22.0;
}

class CoreFontSize {
  double get headline => 20.0;
  double get bodyText1 => 14.0;
  double get bodyText2 => 12.0;
  double get caption => 10.0;
}

class CoreBorderRadius {
  double get none => 0.0;
  double get small => 10.0;
  double get medium => 20.0;
  double get circular => 200.0;
}

class CoreBorderWidth {
  double get none => 0.0;
  double get thin => 1.0;
  double get small => 2.0;
}

class CoreSpacingSize {
  double get spacing0 => 0.0;
  double get spacing25 => 2.0;
  double get spacing50 => 4.0;
  double get spacing100 => 8.0;
  double get spacing150 => 12.0;
  double get spacing200 => 16.0;
  double get spacing300 => 24.0;
  double get spacing400 => 32.0;
  double get spacing500 => 40.0;
  double get spacing600 => 48.0;
  double get spacing700 => 56.0;
  double get spacing800 => 64.0;
}

class CoreColorScheme {
  Color get primary => const Color(0xFF22FFCA);
  Color get secondary => const Color(0xFFFFFFFF);
  Color get background => const Color(0xFF1D1C17);
  Color get surface => const Color(0xFF171612);
  Color get error => const Color(0xFF111111);
  Color get loaderHighlight => const Color.fromARGB(162, 34, 255, 203);

  Color get onPrimary => const Color(0xFFFFFFFF);
  Color get onSecondary => CoreColorScheme().surface;
  Color get onSurface => CoreColorScheme().primary;
  Color get onBackground => CoreColorScheme().surface;
  Color get onError => CoreColorScheme().secondary;
}
