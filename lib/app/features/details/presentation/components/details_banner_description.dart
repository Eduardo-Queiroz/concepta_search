import 'package:concepta/app/components/components.dart';
import 'package:concepta/theme/theme.dart';
import 'package:flutter/material.dart';

class DetailsBannerDescriptionComponent extends StatelessWidget {
  const DetailsBannerDescriptionComponent({
    super.key,
    required this.description,
  });

  final String? description;
  @override
  Widget build(BuildContext context) {
    return CoreContainer(
      margin: const CoreSpacing(
        vertical: CoreSpacingType.spacing200,
        left: CoreSpacingType.spacing200,
        right: CoreSpacingType.spacing150,
      ),
      child: CoreTypography.bodyText2(
        description ?? '',
        color: CoreColorType.secondary,
      ),
    );
  }
}
