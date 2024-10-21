// ignore_for_file: prefer_const_constructors
import 'package:bloc_test/bloc_test.dart';
import 'package:champions_repository/champions_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:league_of_legends_api/league_of_legends_api.dart';
import 'package:lol_app/champions/champions.dart';
import 'package:mocktail/mocktail.dart';

class _MockChampionRepository extends Mock implements ChampionsRepository {}

void main() {
  group(ChampionsBloc, () {
    late ChampionsRepository championRepository;

    setUp(() {
      championRepository = _MockChampionRepository();
    });

    test('initial state is empty', () {
      expect(
        ChampionsBloc(
          championRepository: championRepository,
        ).state,
        equals(ChampionsState()),
      );
    });

    group(ChampionsFetchRequested, () {
      const champion = Champion(
        id: '1',
        name: 'name',
        squareImage: 'image',
      );

      const champions = [champion];

      blocTest<ChampionsBloc, ChampionsState>(
        'emits [${ChampionsStatus.loading}, ${ChampionsStatus.failure}] when '
        'getChampions throws exception',
        setUp: () {
          when(
            () => championRepository.getChampions(),
          ).thenThrow(Exception());
        },
        build: () => ChampionsBloc(championRepository: championRepository),
        act: (bloc) => bloc.add(ChampionsFetchRequested()),
        expect: () => [
          ChampionsState(),
          ChampionsState(status: ChampionsStatus.failure),
        ],
      );

      blocTest<ChampionsBloc, ChampionsState>(
        'emits [${ChampionsStatus.loading}, ${ChampionsStatus.success}] when '
        'getChampions returns characters',
        setUp: () {
          when(
            () => championRepository.getChampions(),
          ).thenAnswer((_) async => champions);
        },
        build: () => ChampionsBloc(championRepository: championRepository),
        act: (bloc) => bloc.add(ChampionsFetchRequested()),
        expect: () => [
          ChampionsState(),
          ChampionsState(
            status: ChampionsStatus.success,
            champions: champions,
          ),
        ],
      );
    });
  });
}
