import 'package:concepta/app/components/components.dart';
import 'package:concepta/app/features/search/domain/entities/suggestion.dart';
import 'package:concepta/app/features/search/presentation/bloc/animation/animation_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../util/constants.dart';
import 'seeds/builder/search_builder.dart';

void main() {
  group('Search List Suggestion Feature:', () {
    testWidgets(
      'should open search input with success',
      (tester) async {
        //arrange
        await SearchSeeds().build(tester);

        //act
        await tester.tap(
          find.byWidgetPredicate(
            (widget) => widget is CoreIcon && widget.icon == Icons.search,
          ),
        );

        await tester.pumpAndSettle();

        //assert
        expect(
          find.byWidgetPredicate(
            (widget) =>
                widget is TextField && widget.showCursor! && widget.enabled!,
          ),
          findsOneWidget,
        );
      },
    );

    testWidgets(
      'should close search input with success',
      (tester) async {
        //arrange
        await SearchSeeds().build(
          tester,
          initialAnimationState: GoToLargeFrame3(),
        );

        //act
        await tester.tap(
          find.byWidgetPredicate((widget) => widget is Scaffold),
        );

        await tester.pumpAndSettle();

        //assert
        expect(
          find.byWidgetPredicate(
            (widget) =>
                widget is TextField && !widget.showCursor! && !widget.enabled!,
          ),
          findsOneWidget,
        );
      },
    );

    testWidgets(
      'should open and show empty search history',
      (tester) async {
        //arrange
        await SearchSeeds().build(
          tester,
        );

        //act
        await tester.tap(
          find.byWidgetPredicate(
            (widget) => widget is CoreIcon && widget.icon == Icons.search,
          ),
        );

        await tester.pumpAndSettle();

        //assert
        expect(
          find.text('No Recent Searchs'),
          findsOneWidget,
        );
      },
    );

    testWidgets(
      'should open and show full history search',
      (tester) async {
        //arrange
        await SearchSeeds().build(
          tester,
          localData: const SuggestionEntity(
            suggestions: localDataMocked,
          ),
        );

        //act
        await tester.tap(
          find.byWidgetPredicate(
            (widget) => widget is CoreIcon && widget.icon == Icons.search,
          ),
        );

        await tester.pumpAndSettle();

        //assert
        expect(
          find.text(localItemDataMocked),
          findsOneWidget,
        );
      },
    );

    testWidgets(
      'should not update request after 2 letters',
      (tester) async {
        //arrange
        await SearchSeeds().build(
          tester,
          localData: const SuggestionEntity(
            suggestions: localDataMocked,
          ),
        );

        //act
        await tester.tap(
          find.byWidgetPredicate(
            (widget) => widget is CoreIcon && widget.icon == Icons.search,
          ),
        );

        await tester.pumpAndSettle();

        await tester.enterText(
          find.byWidgetPredicate((widget) => widget is TextField),
          inputIncompleteText,
        );

        await tester.pumpAndSettle();
        //assert
        expect(
          find.text(localItemDataMocked),
          findsOneWidget,
        );
      },
    );

    testWidgets(
      'should update request after 3 letters',
      (tester) async {
        //arrange
        await SearchSeeds().build(
          tester,
          localData: const SuggestionEntity(
            suggestions: localDataMocked,
          ),
        );

        //act
        await tester.tap(
          find.byWidgetPredicate(
            (widget) => widget is CoreIcon && widget.icon == Icons.search,
          ),
        );

        await tester.pumpAndSettle();

        await tester.enterText(
          find.byWidgetPredicate((widget) => widget is TextField),
          inputCompleteText,
        );

        await tester.pumpAndSettle();

        //assert
        expect(
          find.text(localItemDataMocked),
          findsNothing,
        );

        expect(
          find.text(remoteItemDataMocked),
          findsOneWidget,
        );
      },
    );

    testWidgets(
      'should open and get remote only 6 packages with success',
      (tester) async {
        //arrange
        await SearchSeeds().build(tester);

        //act
        await tester.tap(
          find.byWidgetPredicate(
            (widget) => widget is CoreIcon && widget.icon == Icons.search,
          ),
        );

        await tester.pumpAndSettle();

        await tester.enterText(
          find.byWidgetPredicate((widget) => widget is TextField),
          inputCompleteText,
        );

        await tester.pumpAndSettle();

        //assert
        expect(
          find.byWidgetPredicate((widget) => widget is CoreTypography),
          findsNWidgets(6),
        );
      },
    );
  });
}
