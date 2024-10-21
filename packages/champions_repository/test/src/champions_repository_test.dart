// ignore_for_file: prefer_const_constructors
import 'package:champions_repository/champions_repository.dart';
import 'package:league_of_legends_api/league_of_legends_api.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class _MockLeagueOfLegendsApi extends Mock implements LeagueOfLegendsApi {}

void main() {
  group(ChampionsRepository, () {
    late LeagueOfLegendsApi leagueOfLegendsApi;
    late ChampionsRepository championRepository;

    setUp(() {
      leagueOfLegendsApi = _MockLeagueOfLegendsApi();
      championRepository = ChampionsRepository(
        leagueOfLegendsApi: leagueOfLegendsApi,
      );
    });

    group('constructor', () {
      test('can be instantiated', () {
        expect(
          ChampionsRepository(leagueOfLegendsApi: leagueOfLegendsApi),
          isNotNull,
        );
      });
    });

    group('getChampions', () {
      const championApi = Champion(
        id: '1',
        name: 'Aatrox',
        squareImage: 'image',
      );

      test('makes correct request', () async {
        when(() => leagueOfLegendsApi.getChampions())
            .thenAnswer((_) async => [championApi]);

        await championRepository.getChampions();

        verify(() => leagueOfLegendsApi.getChampions()).called(1);
      });

      test('throws GetChampionsFailure when getChampions fails', () async {
        final exception = Exception('oops');
        when(() => leagueOfLegendsApi.getChampions()).thenThrow(exception);

        await expectLater(
          championRepository.getChampions(),
          throwsA(isA<GetChampionsFailure>()),
        );
      });

      test('returns correct champions on success', () async {
        when(() => leagueOfLegendsApi.getChampions())
            .thenAnswer((_) async => [championApi]);

        expect(championRepository.getChampions(), completion([championApi]));
      });
    });

    group('getChampionDetails', () {
      const championDetailsApi = ChampionDetails(
        id: '1',
        name: 'Aatrox',
        title: 'The Darkin Blade',
        skins: [
          Skin(
            id: '1',
            name: 'Aatrox',
            splashImage: 'splashImage',
            loadingImage: 'loadingImage',
          ),
        ],
      );

      test('makes correct request', () async {
        when(() => leagueOfLegendsApi.getChampionDetails(any()))
            .thenAnswer((_) async => championDetailsApi);

        await championRepository.getChampionDetails('1');

        verify(() => leagueOfLegendsApi.getChampionDetails('1')).called(1);
      });

      test('throws $GetChampionDetailsFailure when getChampionDetails fails',
          () async {
        final exception = Exception('oops');
        when(() => leagueOfLegendsApi.getChampionDetails(any()))
            .thenThrow(exception);

        await expectLater(
          championRepository.getChampionDetails('1'),
          throwsA(isA<GetChampionDetailsFailure>()),
        );
      });

      test('returns correct championDetails on success', () async {
        when(() => leagueOfLegendsApi.getChampionDetails(any()))
            .thenAnswer((_) async => championDetailsApi);

        expect(
          championRepository.getChampionDetails('1'),
          completion(championDetailsApi),
        );
      });
    });
  });
}
