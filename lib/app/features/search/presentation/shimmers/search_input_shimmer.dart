import 'dart:math';

import 'package:concepta/app/components/components.dart';
import 'package:concepta/theme/types/themes.dart';
import 'package:flutter/material.dart';

const fakeTextHeight = 15.0;

class SearchInputShimmer extends StatelessWidget {
  const SearchInputShimmer({super.key});

  getRandomWidth() => 60 + 20.0 * Random().nextInt(3);

  @override
  Widget build(BuildContext context) {
    return CoreShimmer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CoreContainer(
            padding: const CoreSpacing(
              vertical: CoreSpacingType.spacing150,
              left: CoreSpacingType.spacing300,
            ),
            child: CoreContainer(
              border: CoreBorderType.easy,
              color: CoreColorType.primary,
              height: fakeTextHeight,
              width: getRandomWidth(),
            ),
          ),
          CoreDivider(),
          CoreContainer(
            padding: const CoreSpacing(
              vertical: CoreSpacingType.spacing150,
              left: CoreSpacingType.spacing300,
            ),
            child: CoreContainer(
              border: CoreBorderType.easy,
              color: CoreColorType.primary,
              height: fakeTextHeight,
              width: getRandomWidth(),
            ),
          ),
          CoreDivider(),
          CoreContainer(
            padding: const CoreSpacing(
              vertical: CoreSpacingType.spacing150,
              left: CoreSpacingType.spacing300,
            ),
            child: CoreContainer(
              border: CoreBorderType.easy,
              color: CoreColorType.primary,
              height: fakeTextHeight,
              width: getRandomWidth(),
            ),
          ),
          const CoreDivider(),
          CoreContainer(
            padding: const CoreSpacing(
              vertical: CoreSpacingType.spacing150,
              left: CoreSpacingType.spacing300,
            ),
            child: CoreContainer(
              border: CoreBorderType.easy,
              color: CoreColorType.primary,
              height: fakeTextHeight,
              width: getRandomWidth(),
            ),
          ),
          const CoreDivider(),
          CoreContainer(
            padding: const CoreSpacing(
              vertical: CoreSpacingType.spacing150,
              left: CoreSpacingType.spacing300,
            ),
            child: CoreContainer(
              border: CoreBorderType.easy,
              color: CoreColorType.primary,
              height: fakeTextHeight,
              width: getRandomWidth(),
            ),
          ),
          const CoreDivider(),
          CoreContainer(
            padding: const CoreSpacing(
              vertical: CoreSpacingType.spacing150,
              left: CoreSpacingType.spacing300,
            ),
            child: CoreContainer(
              border: CoreBorderType.easy,
              color: CoreColorType.primary,
              height: fakeTextHeight,
              width: getRandomWidth(),
            ),
          ),
        ],
      ),
    );
  }
}
