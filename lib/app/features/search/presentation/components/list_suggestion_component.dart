import 'package:concepta/app/components/components.dart';
import 'package:concepta/app/features/details/infra/routes/details.dart';
import 'package:concepta/infra/router/core_navigator.dart';
import 'package:concepta/infra/util/animation_constants.dart';
import 'package:concepta/theme/types/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/animation/animation_cubit.dart';
import '../bloc/suggestion/suggestion_cubit.dart';
import '../bloc/suggestion/suggestion_state.dart';

class ListSuggestionComponent extends StatelessWidget {
  const ListSuggestionComponent({super.key, required this.state});

  final SearchSuggestionState state;

  @override
  Widget build(BuildContext context) {
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
                      child: const CoreDivider(),
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
