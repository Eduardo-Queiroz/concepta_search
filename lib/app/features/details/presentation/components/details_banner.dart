import 'package:concepta/app/components/components.dart';
import 'package:concepta/theme/types/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/details/details_cubit.dart';
import '../bloc/details/details_state.dart';
import '../shimmers/banner_description_shimmer.dart';
import '../shimmers/banner_info_shimmer.dart';
import 'details_banner_description.dart';
import 'details_banner_info.dart';

const likesText = "LIKES";
const pointsText = "PUB POINTS";
const popularityText = "POPULARITY";

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
                      child: CoreShimmerWrapper(
                        isLoading:
                            state is DetailsInitial || state is DetailsLoading,
                        shimmer: const BannerInfoShimmer(),
                        body: DetailsBannerInfoComponent(
                          info: state.info,
                        ),
                      ),
                    ),
                    Row(
                      children: const [
                        Expanded(
                          child: CoreTypography.caption(
                            likesText,
                            color: CoreColorType.secondary,
                          ),
                        ),
                        Expanded(
                          child: CoreTypography.caption(
                            pointsText,
                            color: CoreColorType.secondary,
                          ),
                        ),
                        Expanded(
                          child: CoreTypography.caption(
                            popularityText,
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
              CoreShimmerWrapper(
                isLoading: state is DetailsInitial || state is DetailsLoading,
                shimmer: const BannerDescriptionShimmer(),
                body: DetailsBannerDescriptionComponent(
                  description: state.info?.description,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
