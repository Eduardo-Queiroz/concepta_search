import 'package:concepta/app/components/components.dart';
import 'package:concepta/theme/types/themes.dart';
import 'package:concepta/theme/util/formatters.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/details/details_cubit.dart';
import '../bloc/details/details_state.dart';

class DetailBannerShimmer extends StatelessWidget {
  const DetailBannerShimmer({super.key});

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
              CoreDivider(),
              CoreShimmer(
                child: CoreContainer(
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
                            child: CoreContainer(
                              border: CoreBorderType.easy,
                              height: 25,
                              width: 50,
                              color: CoreColorType.primary,
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
                            child: CoreContainer(
                              border: CoreBorderType.easy,
                              height: 25,
                              width: 50,
                              color: CoreColorType.primary,
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
                            child: CoreContainer(
                              border: CoreBorderType.easy,
                              height: 25,
                              width: 50,
                              color: CoreColorType.primary,
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
              ),
              CoreDivider(),
              CoreShimmer(
                child: CoreContainer(
                  margin: const CoreSpacing(
                    vertical: CoreSpacingType.spacing200,
                    left: CoreSpacingType.spacing200,
                    right: CoreSpacingType.spacing150,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
              )
            ],
          ),
        );
      },
    );
  }
}
