import 'dart:io';

class CoreDelay {
  final isTest = Platform.environment.containsKey('FLUTTER_TEST');
  Duration get veryLong => isTest
      ? const Duration(microseconds: 0)
      : const Duration(milliseconds: 1000);
  Duration get long => isTest
      ? const Duration(microseconds: 0)
      : const Duration(milliseconds: 500);
  Duration get easy => isTest
      ? const Duration(microseconds: 0)
      : const Duration(milliseconds: 300);
  Duration get quick => isTest
      ? const Duration(microseconds: 0)
      : const Duration(milliseconds: 150);
  Duration get fade => isTest
      ? const Duration(microseconds: 0)
      : const Duration(milliseconds: 50);
}
