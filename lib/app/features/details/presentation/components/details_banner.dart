import 'package:concepta/app/components/components.dart';
import 'package:concepta/infra/util/animation_constants.dart';
import 'package:concepta/theme/types/themes.dart';
import 'package:concepta/theme/util/formatters.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/details/details_cubit.dart';
import '../bloc/details/details_state.dart';
import '../shimmers/banner_description_shimmer.dart';
import '../shimmers/banner_info_shimmer.dart';
import 'details_banner_description.dart';
import 'details_banner_info.dart';

class DetailBannerComponent extends StatelessWidget {
  const DetailBannerComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailsCubit, DetailsState>(
      builder: (context, state) {
        return CoreContainer.card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CoreContainer(
                margin: const CoreSpacing(
                  vertical: CoreSpacingType.spacing150,
                  horizontal: CoreSpacingType.spacing200,
                ),
                child: CoreTypography.bodyText1(state.name!),
              ),
              const CoreDivider(),
              CoreContainer(
                margin: const CoreSpacing(
                  vertical: CoreSpacingType.spacing150,
                  horizontal: CoreSpacingType.spacing200,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CoreContainer(
                      margin: const CoreSpacing(
                        bottom: CoreSpacingType.spacing25,
                      ),
                      child: AnimatedSwitcher(
                        duration: CoreDelay().easy,
                        switchInCurve: Curves.ease,
                        child: DetailsBannerInfoComponent(state: state),
                      ),
                    ),
                    Row(
                      children: const [
                        Expanded(
                          child: CoreTypography.caption(
                            "LIKES",
                            color: CoreColorType.secondary,
                          ),
                        ),
                        Expanded(
                          child: CoreTypography.caption(
                            "PUB POINTS",
                            color: CoreColorType.secondary,
                          ),
                        ),
                        Expanded(
                          child: CoreTypography.caption(
                            "POPULARITY",
                            color: CoreColorType.secondary,
                            textAlign: TextAlign.right,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const CoreDivider(),
              AnimatedSwitcher(
                duration: CoreDelay().easy,
                switchInCurve: Curves.ease,
                child: CoreContainer(
                  margin: const CoreSpacing(
                    vertical: CoreSpacingType.spacing200,
                    left: CoreSpacingType.spacing200,
                    right: CoreSpacingType.spacing150,
                  ),
                  child: DetailsBannerDescriptionComponent(state: state),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
