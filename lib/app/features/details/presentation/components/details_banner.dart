import 'package:concepta/app/components/components.dart';
import 'package:concepta/infra/util/animation_constants.dart';
import 'package:concepta/theme/types/themes.dart';
import 'package:concepta/theme/util/formatters.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/details/details_cubit.dart';
import '../bloc/details/details_state.dart';
import '../shimmers/banner_shimmer.dart';

class DetailBannerComponent extends StatelessWidget {
  const DetailBannerComponent({super.key});

  Widget getCurrentDetailsBanner(state) {
    if (state is DetailsInitial || state is DetailsLoading) {
      return const DetailBannerShimmer();
    }
    if (state is DetailsError) {
      return const SizedBox.shrink();
    }

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
          CoreDivider(),
          CoreContainer(
            margin: const CoreSpacing(
              vertical: CoreSpacingType.spacing150,
              horizontal: CoreSpacingType.spacing200,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CoreContainer(
                      margin: const CoreSpacing(
                        bottom: CoreSpacingType.spacing25,
                      ),
                      child: CoreTypography.headline(
                        state.info!.likes.toString(),
                      ),
                    ),
                    const CoreTypography.caption(
                      "LIKES",
                      color: CoreColorType.secondary,
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CoreContainer(
                      margin: const CoreSpacing(
                        bottom: CoreSpacingType.spacing25,
                      ),
                      child: CoreTypography.headline(
                        placeholderNumber(
                          value: state.info!.points,
                        ),
                      ),
                    ),
                    const CoreTypography.caption(
                      "PUB POINTS",
                      color: CoreColorType.secondary,
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CoreContainer(
                      margin: const CoreSpacing(
                        bottom: CoreSpacingType.spacing25,
                      ),
                      child: CoreTypography.headline(
                        formatPercentage(state.info!.popularity),
                      ),
                    ),
                    const CoreTypography.caption(
                      "POPULARITY",
                      color: CoreColorType.secondary,
                    ),
                  ],
                ),
              ],
            ),
          ),
          CoreDivider(),
          CoreContainer(
            margin: const CoreSpacing(
              vertical: CoreSpacingType.spacing200,
              left: CoreSpacingType.spacing200,
              right: CoreSpacingType.spacing150,
            ),
            child: CoreTypography.bodyText2(
              state.info!.details,
              color: CoreColorType.secondary,
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailsCubit, DetailsState>(
      builder: (context, state) {
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 400),
          transitionBuilder: (
            Widget child,
            Animation<double> animation,
          ) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
          child: getCurrentDetailsBanner(state),
        );
      },
    );
  }
}
