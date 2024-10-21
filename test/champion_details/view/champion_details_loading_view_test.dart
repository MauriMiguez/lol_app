import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lol_app/champion_details/champion_details.dart';

import '../../helpers/pump_app.dart';

void main() {
  group(ChampionDetailsLoadingView, () {
    testWidgets('renders a $CircularProgressIndicator', (tester) async {
      await tester.pumpApp(const ChampionDetailsLoadingView());

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });
  });
}
