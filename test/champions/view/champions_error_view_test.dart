import 'package:flutter_test/flutter_test.dart';
import 'package:lol_app/champions/champions.dart';

import '../../helpers/helpers.dart';

void main() {
  group(ChampionsErrorView, () {
    testWidgets('renders an error text', (tester) async {
      await tester.pumpApp(const ChampionsErrorView());

      final l10n = tester.l10n;

      expect(find.text(l10n.errorViewMessage), findsOneWidget);
    });
  });
}
