import 'package:equatable/equatable.dart';
import 'package:concepta/infra/util/animation_constants.dart';

enum InteractiveInputStateType {
  disabled,
  tap,
  input,
}

class SearchAnimations {
  SearchAnimations.show() : visibility = true;
  SearchAnimations.hide() : visibility = false;
  final bool visibility;
}

class CursorAnimations {
  CursorAnimations.asSearch()
      : visibility = true,
        angle = 135,
        height = 7.5,
        leftPosition = 27,
        bottomPosition = 13;

  CursorAnimations.asCursor()
      : visibility = true,
        angle = 180,
        height = 21,
        leftPosition = 23.5,
        bottomPosition = 12;

  CursorAnimations.hide()
      : visibility = false,
        angle = 180,
        height = 21,
        leftPosition = 23.5,
        bottomPosition = 12;

  final bool visibility;
  final double angle;
  final double height;
  final double leftPosition;
  final double bottomPosition;
}

class InputAnimations {
  InputAnimations.largeEnabled()
      : width = 300,
        interactiveState = InteractiveInputStateType.input;

  InputAnimations.largeDisabled()
      : width = 300,
        interactiveState = InteractiveInputStateType.disabled;

  InputAnimations.smallEnabled()
      : width = 50,
        interactiveState = InteractiveInputStateType.tap;

  InputAnimations.smallDisabled()
      : width = 50,
        interactiveState = InteractiveInputStateType.tap;

  final double width;
  final InteractiveInputStateType interactiveState;
  bool get isEnable => interactiveState == InteractiveInputStateType.input;
  bool get isOpened => width == 300;
}

class SearchAnimationState {
  SearchAnimationState({
    required this.search,
    required this.cursor,
    required this.input,
    required this.duration,
  });

  final SearchAnimations search;
  final CursorAnimations cursor;
  final InputAnimations input;
  final Duration duration;
}

class InitialFrame extends SearchAnimationState with EquatableMixin {
  InitialFrame()
      : super(
          search: SearchAnimations.show(),
          cursor: CursorAnimations.asSearch(),
          input: InputAnimations.smallEnabled(),
          duration: CoreDelay().easy,
        );

  @override
  List<Object?> get props => <Object?>[];
}

class GoToSmallFrame1 extends SearchAnimationState with EquatableMixin {
  GoToSmallFrame1()
      : super(
          search: SearchAnimations.hide(),
          cursor: CursorAnimations.asCursor(),
          input: InputAnimations.largeDisabled(),
          duration: CoreDelay().easy,
        );

  @override
  List<Object?> get props => <Object?>[];
}

class GoToSmallFrame2 extends SearchAnimationState with EquatableMixin {
  GoToSmallFrame2()
      : super(
          search: SearchAnimations.hide(),
          cursor: CursorAnimations.asSearch(),
          input: InputAnimations.largeDisabled(),
          duration: CoreDelay().easy,
        );

  @override
  List<Object?> get props => <Object?>[];
}

class GoToSmallFrame3 extends SearchAnimationState with EquatableMixin {
  GoToSmallFrame3()
      : super(
          search: SearchAnimations.show(),
          cursor: CursorAnimations.asSearch(),
          input: InputAnimations.largeDisabled(),
          duration: CoreDelay().easy,
        );

  @override
  List<Object?> get props => <Object?>[];
}

class GoToSmallFrame4 extends SearchAnimationState with EquatableMixin {
  GoToSmallFrame4()
      : super(
          search: SearchAnimations.show(),
          cursor: CursorAnimations.asSearch(),
          input: InputAnimations.smallEnabled(),
          duration: CoreDelay().easy,
        );

  @override
  List<Object?> get props => <Object?>[];
}

class GoToLargeFrame1 extends SearchAnimationState with EquatableMixin {
  GoToLargeFrame1()
      : super(
          search: SearchAnimations.hide(),
          cursor: CursorAnimations.asCursor(),
          input: InputAnimations.smallDisabled(),
          duration: CoreDelay().easy,
        );

  @override
  List<Object?> get props => <Object?>[];
}

class GoToLargeFrame2 extends SearchAnimationState with EquatableMixin {
  GoToLargeFrame2()
      : super(
          search: SearchAnimations.hide(),
          cursor: CursorAnimations.asCursor(),
          input: InputAnimations.largeDisabled(),
          duration: CoreDelay().long,
        );

  @override
  List<Object?> get props => <Object?>[];
}

class GoToLargeFrame3 extends SearchAnimationState with EquatableMixin {
  GoToLargeFrame3()
      : super(
          search: SearchAnimations.hide(),
          cursor: CursorAnimations.hide(),
          input: InputAnimations.largeEnabled(),
          duration: CoreDelay().easy,
        );

  @override
  List<Object?> get props => <Object?>[];
}
