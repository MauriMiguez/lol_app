// ignore_for_file: prefer_const_constructors
import 'package:flutter_test/flutter_test.dart';
import 'package:lol_app/champion_details/champion_details.dart';

void main() {
  group(ChampionDetailsEvent, () {
    group(ChampionDetailsFetchRequested, () {
      test('support value equality', () {
        const championId = '1';

        final instanceA = ChampionDetailsFetchRequested(championId: championId);
        final instanceB = ChampionDetailsFetchRequested(championId: championId);

        expect(instanceA, equals(instanceB));
      });
    });
  });
}
