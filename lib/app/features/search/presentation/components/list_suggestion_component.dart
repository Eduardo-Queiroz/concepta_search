import 'package:concepta/app/components/components.dart';
import 'package:concepta/app/features/details/infra/routes/details.dart';
import 'package:concepta/infra/router/core_navigator.dart';
import 'package:concepta/infra/util/animation_constants.dart';
import 'package:concepta/theme/types/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/animation/animation_cubit.dart';
import '../bloc/animation/animation_state.dart';
import '../bloc/suggestion/suggestion_cubit.dart';
import '../bloc/suggestion/suggestion_state.dart';
import '../shimmers/search_input_shimmer.dart';

class ListSuggestionComponent extends StatelessWidget {
  const ListSuggestionComponent({super.key});

  Widget getCurrentSuggestionBanner(state) {
    if (state is SearchSuggestionLoading) {
      return const SearchInputShimmer();
    } else {
      return Column(
        children: [
          CoreContainer(
            visible: state.hasTitle,
            margin: const CoreSpacing(
              top: CoreSpacingType.spacing100,
              vertical: CoreSpacingType.spacing150,
            ),
            child: CoreTypography.bodyText2(
              state.title,
              textAlign: TextAlign.center,
            ),
          ),
          CoreStaggeredWrapper(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: state.suggestions.length,
              itemBuilder: (BuildContext context, int index) {
                final name = state.suggestions[index];
                return CoreStaggeredList(
                  index: index,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Visibility(
                        visible: !(!state.hasTitle && index == 0),
                        child: CoreDivider(),
                      ),
                      InkWell(
                        onTap: () {
                          CoreNavigator.of(context).pushNamed(
                            DetailsRoute(name: name),
                          );
                          context
                              .read<SearchSuggestionCubit>()
                              .selectSuggestion(name: name);

                          Future.delayed(CoreDelay().long, () {
                            context.read<SearchAnimationCubit>().goToSmall();
                          });
                        },
                        child: CoreContainer(
                          width: 400,
                          padding: const CoreSpacing(
                            vertical: CoreSpacingType.spacing150,
                            left: CoreSpacingType.spacing300,
                          ),
                          child: CoreTypography.bodyText2(name),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchAnimationCubit, SearchAnimationState>(
      listener: (context, state) {
        if (state is GoToSmallFrame4) {
          context.read<SearchSuggestionCubit>().inputClear();
        }
      },
      buildWhen: (previous, current) =>
          previous.input.width != current.input.width,
      builder: (context, state) {
        return AnimatedOpacity(
          curve: Curves.ease,
          duration: CoreDelay().long,
          opacity: state.input.isOpened ? 1 : 0,
          child: CoreContainer.card(
            border: CoreBorderType.curve,
            margin: const CoreSpacing(top: CoreSpacingType.spacing100),
            width: 300,
            child: BlocBuilder<SearchSuggestionCubit, SearchSuggestionState>(
              builder: (context, state) {
                return AnimatedSwitcher(
                  duration: CoreDelay().quick,
                  transitionBuilder: (
                    Widget child,
                    Animation<double> animation,
                  ) {
                    return FadeTransition(
                      opacity: animation,
                      child: child,
                    );
                  },
                  child: getCurrentSuggestionBanner(state),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
