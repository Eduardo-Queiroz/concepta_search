import 'package:concepta/app/components/components.dart';
import 'package:concepta/infra/util/animation_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:concepta/theme/theme.dart';

import '../bloc/animation/animation_cubit.dart';
import '../bloc/animation/animation_state.dart';
import '../bloc/suggestion/suggestion_cubit.dart';

class SearchInputComponent extends StatefulWidget {
  const SearchInputComponent({super.key});

  @override
  State<SearchInputComponent> createState() => _SearchInputState();
}

class _SearchInputState extends State<SearchInputComponent> {
  TextEditingController controller = TextEditingController();
  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      context.read<SearchSuggestionCubit>().inputValue(controller.text);
    });
  }

  void onInteractInput(BuildContext context, InteractiveInputStateType type) {
    switch (type) {
      case InteractiveInputStateType.disabled:
        break;
      case InteractiveInputStateType.tap:
        context.read<SearchAnimationCubit>().goToLarge();
        break;
      case InteractiveInputStateType.input:
        FocusManager.instance.primaryFocus?.nextFocus();
        break;
    }
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchAnimationCubit, SearchAnimationState>(
      listener: (context, state) {
        if (state is GoToLargeFrame2) {
          context.read<SearchSuggestionCubit>().getSuggestion();
        }
        if (state is GoToSmallFrame1) {
          controller.clear();
        }
      },
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            onInteractInput(context, state.input.interactiveState);
          },
          child: AnimatedContainer(
            duration: CoreDelay().easy,
            width: state.input.width,
            child: CoreContainer(
              border: CoreBorderType.circular,
              child: Stack(
                children: <Widget>[
                  CoreContainer(
                    height: 45,
                    child: TextField(
                      controller: controller,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.only(
                          top: 10,
                          bottom: 15,
                          left: 24,
                          right: 15,
                        ),
                        border: InputBorder.none,
                      ),
                      showCursor: state.input.isEnable,
                      enabled: state.input.isEnable,
                      textInputAction: TextInputAction.next,
                    ),
                  ),
                  Positioned(
                    left: 12,
                    top: 12.0,
                    height: 20,
                    child: AnimatedOpacity(
                      duration: CoreDelay().quick,
                      opacity: state.search.visibility ? 1 : 0,
                      child: const CoreIcon.medium(icon: Icons.search),
                    ),
                  ),
                  AnimatedPositioned(
                    left: state.cursor.leftPosition,
                    bottom: state.cursor.bottomPosition,
                    duration: CoreDelay().easy,
                    child: AnimatedOpacity(
                      duration: CoreDelay().fade,
                      opacity: state.cursor.visibility ? 1 : 0,
                      child: CoreAnimatedRotation(
                        angle: state.cursor.angle,
                        duration: CoreDelay().easy,
                        child: AnimatedContainer(
                          duration: CoreDelay().easy,
                          height: state.cursor.height,
                          child: CoreCursorFake(),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
