import 'package:concepta/app/components/components.dart';
import 'package:concepta/theme/types/themes.dart';
import 'package:flutter/material.dart';

class BannerDescriptionShimmer extends StatelessWidget {
  const BannerDescriptionShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 50,
      child: CoreShimmer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            CoreContainer(
              margin: CoreSpacing(
                bottom: CoreSpacingType.spacing50,
              ),
              border: CoreBorderType.easy,
              height: 12,
              color: CoreColorType.primary,
            ),
            CoreContainer(
              width: 170,
              border: CoreBorderType.easy,
              height: 12,
              color: CoreColorType.primary,
            ),
          ],
        ),
      ),
    );
  }
}
