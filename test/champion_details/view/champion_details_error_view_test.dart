import 'package:flutter_test/flutter_test.dart';
import 'package:lol_app/champion_details/champion_details.dart';

import '../../helpers/helpers.dart';

void main() {
  group(ChampionDetailsErrorView, () {
    testWidgets('renders an error text', (tester) async {
      await tester.pumpApp(const ChampionDetailsErrorView());

      final l10n = tester.l10n;

      expect(find.text(l10n.errorViewMessage), findsOneWidget);
    });
  });
}
