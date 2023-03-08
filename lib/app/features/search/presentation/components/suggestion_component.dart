import 'package:concepta/app/components/components.dart';
import 'package:concepta/infra/util/animation_constants.dart';
import 'package:concepta/theme/types/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/animation/animation_cubit.dart';
import '../bloc/animation/animation_state.dart';
import '../bloc/suggestion/suggestion_cubit.dart';
import '../bloc/suggestion/suggestion_state.dart';
import '../shimmers/search_input_shimmer.dart';
import 'list_suggestion_component.dart';

class SuggestionComponent extends StatelessWidget {
  const SuggestionComponent({super.key});

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
              builder: (context, state) => CoreShimmerWrapper(
                isLoading: state is SearchSuggestionLoading,
                shimmer: const SearchInputShimmer(),
                body: ListSuggestionComponent(
                  state: state,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
