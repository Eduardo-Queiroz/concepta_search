import 'package:concepta/app/components/components.dart';
import 'package:concepta/infra/router/core_navigator.dart';
import 'package:concepta/theme/types/themes.dart';
import 'package:flutter/material.dart';

class ButtonBackComponent extends StatelessWidget {
  const ButtonBackComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      customBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100),
      ),
      onTap: () {
        CoreNavigator.of(context).pop();
      },
      child: const CoreContainer(
        border: CoreBorderType.circular,
        padding: CoreSpacing(
          all: CoreSpacingType.spacing100,
        ),
        child: CoreIcon.medium(
          icon: Icons.arrow_back,
          semanticLabel: "arrow back",
        ),
      ),
    );
  }
}
