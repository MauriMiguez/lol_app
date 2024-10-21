// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:lol_app/champion_details/champion_details.dart';

void main() {
  group(ChampionDetailsState, () {
    test('support value equality', () {
      final state = ChampionDetailsState();

      expect(state.copyWith(), equals(state));
    });
  });
}
