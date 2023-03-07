import 'package:concepta/app/components/components.dart';
import 'package:concepta/theme/types/themes.dart';
import 'package:flutter/material.dart';

class BannerInfoShimmer extends StatelessWidget {
  const BannerInfoShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return CoreShimmer(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Expanded(
            child: CoreContainer(
              alignment: Alignment.centerLeft,
              child: CoreContainer(
                alignment: Alignment.centerLeft,
                border: CoreBorderType.easy,
                height: 24,
                width: 40,
                color: CoreColorType.primary,
              ),
            ),
          ),
          Expanded(
            child: CoreContainer(
              alignment: Alignment.centerLeft,
              child: CoreContainer(
                border: CoreBorderType.easy,
                height: 24,
                width: 40,
                color: CoreColorType.primary,
              ),
            ),
          ),
          Expanded(
            child: CoreContainer(
              alignment: Alignment.centerLeft,
              child: CoreContainer(
                margin: CoreSpacing(left: CoreSpacingType.spacing150),
                border: CoreBorderType.easy,
                height: 24,
                width: 50,
                color: CoreColorType.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
