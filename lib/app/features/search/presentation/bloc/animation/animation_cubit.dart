import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'animation_state.dart';

class SearchAnimationCubit extends Cubit<SearchAnimationState> {
  SearchAnimationCubit({
    SearchAnimationState? initialState,
  }) : super(initialState ?? InitialFrame());

  Future<void> goToSmall() async {
    if (state.input.isEnable) {
      final firstFrame = GoToSmallFrame1();
      final secondFrame = GoToSmallFrame2();
      final thirdFrame = GoToSmallFrame3();
      final fourthFrame = GoToSmallFrame4();

      emit(firstFrame);
      await Future.delayed(firstFrame.duration);

      emit(secondFrame);
      await Future.delayed(secondFrame.duration);

      emit(thirdFrame);
      await Future.delayed(thirdFrame.duration);

      emit(fourthFrame);
      await Future.delayed(fourthFrame.duration);
    }
  }

  Future<void> goToLarge() async {
    final firstFrame = GoToLargeFrame1();
    final secondFrame = GoToLargeFrame2();
    final thirdFrame = GoToLargeFrame3();

    emit(firstFrame);
    await Future.delayed(firstFrame.duration);

    emit(secondFrame);
    await Future.delayed(secondFrame.duration);

    emit(thirdFrame);
    await Future.delayed(thirdFrame.duration);

    FocusManager.instance.primaryFocus?.nextFocus();
  }
}
