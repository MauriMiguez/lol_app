import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lol_app/champions/champions.dart';

import '../../helpers/pump_app.dart';

void main() {
  group(ChampionsLoadingView, () {
    testWidgets('renders a $CircularProgressIndicator', (tester) async {
      await tester.pumpApp(const ChampionsLoadingView());

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });
  });
}
