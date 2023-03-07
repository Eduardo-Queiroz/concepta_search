import 'package:concepta/app/components/components.dart';
import 'package:concepta/theme/theme.dart';
import 'package:flutter/material.dart';

import '../bloc/details/details_state.dart';
import '../shimmers/banner_description_shimmer.dart';

class DetailsBannerDescriptionComponent extends StatelessWidget {
  const DetailsBannerDescriptionComponent({
    super.key,
    required this.state,
  });

  final DetailsState state;
  @override
  Widget build(BuildContext context) {
    if (state is DetailsInitial || state is DetailsLoading) {
      return const BannerDescriptionShimmer();
    }
    return CoreTypography.bodyText2(
      state.info!.details,
      color: CoreColorType.secondary,
    );
  }
}
