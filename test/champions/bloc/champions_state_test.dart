// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:lol_app/champions/champions.dart';

void main() {
  group(ChampionsState, () {
    test('support value equality', () {
      final state = ChampionsState();
      expect(state.copyWith(), equals(state));
    });
  });
}
