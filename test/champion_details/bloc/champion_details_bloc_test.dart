// ignore_for_file: prefer_const_constructors, lines_longer_than_80_chars
import 'package:bloc_test/bloc_test.dart';
import 'package:champions_repository/champions_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:league_of_legends_api/league_of_legends_api.dart';
import 'package:lol_app/champion_details/champion_details.dart';
import 'package:mocktail/mocktail.dart';

class _MockChampionRepository extends Mock implements ChampionsRepository {}

void main() {
  group(ChampionDetailsBloc, () {
    late ChampionsRepository championRepository;

    setUp(() {
      championRepository = _MockChampionRepository();
    });

    test('initial state is empty', () {
      expect(
        ChampionDetailsBloc(
          championRepository: championRepository,
        ).state,
        equals(ChampionDetailsState()),
      );
    });

    group(ChampionDetailsFetchRequested, () {
      const skins = [
        Skin(
          id: '1',
          name: 'Aatrox',
          splashImage: 'splashImage',
          loadingImage: 'loadingImage',
        ),
      ];

      const championDetails = ChampionDetails(
        id: '1',
        name: 'Aatrox',
        title: 'The Darkin Blade',
        skins: skins,
      );

      blocTest<ChampionDetailsBloc, ChampionDetailsState>(
        'emits [${ChampionDetailsStatus.loading}, ${ChampionDetailsStatus.failure}] when '
        'getChampionDetails throws exception',
        setUp: () {
          when(
            () => championRepository.getChampionDetails(any()),
          ).thenThrow(Exception());
        },
        build: () =>
            ChampionDetailsBloc(championRepository: championRepository),
        act: (bloc) => bloc.add(ChampionDetailsFetchRequested(championId: '1')),
        expect: () => [
          ChampionDetailsState(),
          ChampionDetailsState(status: ChampionDetailsStatus.failure),
        ],
      );

      blocTest<ChampionDetailsBloc, ChampionDetailsState>(
        'emits [${ChampionDetailsStatus.loading}, ${ChampionDetailsStatus.success}] when '
        'getChampionDetails returns characters',
        setUp: () {
          when(
            () => championRepository.getChampionDetails(any()),
          ).thenAnswer((_) async => championDetails);
        },
        build: () =>
            ChampionDetailsBloc(championRepository: championRepository),
        act: (bloc) => bloc.add(ChampionDetailsFetchRequested(championId: '1')),
        expect: () => [
          ChampionDetailsState(),
          ChampionDetailsState(
            status: ChampionDetailsStatus.success,
            championDetails: championDetails,
          ),
        ],
      );
    });
  });
}
