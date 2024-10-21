import 'package:flutter_test/flutter_test.dart';
import 'package:lol_app/champion_details/champion_details.dart';

import '../../helpers/helpers.dart';

void main() {
  group(DotsIndicator, () {
    testWidgets('renders $Dot', (tester) async {
      await tester.pumpApp(
        const DotsIndicator(
          currentIndex: 0,
          length: 3,
        ),
      );

      expect(find.byType(Dot), findsNWidgets(3));
    });

    testWidgets('renders selected $Dot', (tester) async {
      await tester.pumpApp(
        const DotsIndicator(
          currentIndex: 1,
          length: 3,
        ),
      );

      expect(
        find.byWidgetPredicate(
          (widget) => widget is Dot && widget.isSelected,
          description: 'selected $Dot',
        ),
        findsOneWidget,
      );
    });
  });
}
