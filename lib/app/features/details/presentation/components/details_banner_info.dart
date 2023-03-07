import 'package:concepta/app/components/components.dart';
import 'package:concepta/theme/theme.dart';
import 'package:concepta/theme/util/formatters.dart';
import 'package:flutter/material.dart';

import '../bloc/details/details_state.dart';
import '../shimmers/banner_info_shimmer.dart';

class DetailsBannerInfoComponent extends StatelessWidget {
  const DetailsBannerInfoComponent({
    super.key,
    required this.state,
  });

  final DetailsState state;
  @override
  Widget build(BuildContext context) {
    if (state is DetailsInitial || state is DetailsLoading) {
      return const BannerInfoShimmer();
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: CoreTypography.headline(
            state.info!.likes.toString(),
          ),
        ),
        Expanded(
          child: CoreTypography.headline(
            placeholderNumber(
              value: state.info!.points,
            ),
          ),
        ),
        Expanded(
          child: CoreContainer(
            margin: const CoreSpacing(
              left: CoreSpacingType.spacing150,
            ),
            child: CoreTypography.headline(
              formatPercentage(state.info!.popularity),
            ),
          ),
        ),
      ],
    );
  }
}
