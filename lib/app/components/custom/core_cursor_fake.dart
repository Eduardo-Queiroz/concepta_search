import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:concepta/theme/theme.dart';

class CoreCursorFake extends StatelessWidget with CoreThemeDataMixin {
  @override
  Widget build(BuildContext context) {
    final currentPrimaryColor = getThemedColor(context, CoreColorType.primary);
    return Container(
      width: 1.8,
      decoration: BoxDecoration(
        border: Border.all(
          color: currentPrimaryColor,
        ),
        borderRadius: BorderRadius.circular(1),
      ),
    );
  }
}
