import 'package:concepta/app/features/details/infra/routes/details.dart';
import 'package:flutter_test/flutter_test.dart';

import 'seeds/builder/detail_builder.dart';

void main() {
  group('Detail Package Feature:', () {
    testWidgets(
      'should get current package with success',
      (tester) async {
        //arrange and act
        await DetailsSeeds().build(
          tester,
          route: DetailsRoute(name: '.'),
        );

        await tester.pumpAndSettle();

        //assert
        expect(find.text('description'), findsOneWidget);
        expect(find.text('10'), findsOneWidget);
        expect(find.text('20'), findsOneWidget);
        expect(find.text('99%'), findsOneWidget);
      },
    );
  });
}
