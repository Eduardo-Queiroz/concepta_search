import 'package:concepta/app/components/custom/core_wrapper_concepta.dart';
import 'package:concepta/app/components/layout/core_container.dart';
import 'package:concepta/app/features/search/presentation/components/search_input_component.dart';
import 'package:concepta/theme/types/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/animation/animation_cubit.dart';
import '../components/list_suggestion_component.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: context.read<SearchAnimationCubit>().goToSmall,
      child: const Scaffold(
        body: CoreWrapperConcepta(
          children: [
            SearchInputComponent(),
            ListSuggestionComponent(),
          ],
        ),
      ),
    );
  }
}
