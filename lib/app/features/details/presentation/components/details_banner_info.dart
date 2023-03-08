import 'package:concepta/app/components/components.dart';
import 'package:concepta/theme/theme.dart';
import 'package:concepta/theme/util/formatters.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/detail.dart';

class DetailsBannerInfoComponent extends StatelessWidget {
  const DetailsBannerInfoComponent({
    super.key,
    required this.info,
  });

  final DetailEntity? info;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: CoreTypography.headline(
            placeholderNumber(
              value: info?.likes,
            ),
          ),
        ),
        Expanded(
          child: CoreTypography.headline(
            placeholderNumber(
              value: info?.points,
            ),
          ),
        ),
        Expanded(
          child: CoreContainer(
            margin: const CoreSpacing(
              left: CoreSpacingType.spacing150,
            ),
            child: CoreTypography.headline(
              formatPercentage(info?.popularity),
            ),
          ),
        ),
      ],
    );
  }
}
