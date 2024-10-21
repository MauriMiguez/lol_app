// ignore_for_file: prefer_const_constructors
import 'package:flutter_test/flutter_test.dart';
import 'package:lol_app/champions/champions.dart';

void main() {
  group(ChampionsEvent, () {
    group(ChampionsFetchRequested, () {
      test('support value equality', () {
        final instanceA = ChampionsFetchRequested();
        final instanceB = ChampionsFetchRequested();

        expect(instanceA, equals(instanceB));
      });
    });
  });
}
