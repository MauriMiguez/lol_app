import 'package:http/http.dart';
import 'package:league_of_legends_api/league_of_legends_api.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import 'responses.dart';

class _MockHttpClient extends Mock implements Client {}

class _MockResponse extends Mock implements Response {}

class _FakeUri extends Fake implements Uri {}

void main() {
  group(LeagueOfLegendsApi, () {
    late _MockHttpClient httpClient;
    late LeagueOfLegendsApi api;

    setUpAll(() {
      registerFallbackValue(_FakeUri());
    });

    setUp(() {
      httpClient = _MockHttpClient();
      api = LeagueOfLegendsApi(httpClient: httpClient);
    });

    test('can be instantiated', () {
      expect(LeagueOfLegendsApi(), isA<LeagueOfLegendsApi>());
    });

    group('getChampions', () {
      test('returns list of $Champion if request succeeds', () {
        final response = _MockResponse();
        when(() => response.statusCode).thenReturn(200);
        when(() => response.body).thenReturn(validChampionsResponse);
        when(() => httpClient.get(any())).thenAnswer((_) async => response);
        expect(
          api.getChampions(),
          completion(
            isA<List<Champion>>()
                .having((r) => r.length, 'length', greaterThan(0)),
          ),
        );
      });

      test('throws $HttpErrorResponse if status code is not 200', () async {
        final response = _MockResponse();
        when(() => response.statusCode).thenReturn(404);
        when(() => httpClient.get(any())).thenAnswer((_) async => response);
        expect(
          api.getChampions(),
          throwsA(isA<HttpErrorResponse>()),
        );
      });

      test('throws $HttpMalformedResponse on invalid json', () async {
        final response = _MockResponse();
        when(() => response.statusCode).thenReturn(200);
        when(() => response.body).thenReturn('{');
        when(() => httpClient.get(any())).thenAnswer((_) async => response);
        expect(
          api.getChampions(),
          throwsA(isA<HttpMalformedResponse>()),
        );
      });

      test('throws $HttpMalformedResponse on empty response', () async {
        final response = _MockResponse();
        when(() => response.statusCode).thenReturn(200);
        when(() => response.body).thenReturn('{}');
        when(() => httpClient.get(any())).thenAnswer((_) async => response);
        expect(
          api.getChampions(),
          throwsA(isA<HttpMalformedResponse>()),
        );
      });

      test(
          'throws $HttpMalformedResponse if response body does not '
          'contain data key', () async {
        final response = _MockResponse();
        when(() => response.statusCode).thenReturn(200);
        when(() => response.body).thenReturn('{"test": "test"}');
        when(() => httpClient.get(any())).thenAnswer((_) async => response);
        expect(
          api.getChampions(),
          throwsA(isA<HttpMalformedResponse>()),
        );
      });
    });

    group('getChampionDetails', () {
      const championId = 'Aatrox';

      test('returns a $ChampionDetails if request succeeds', () {
        final response = _MockResponse();
        when(() => response.statusCode).thenReturn(200);
        when(() => response.body).thenReturn(validChampionDetailsResponse);
        when(() => httpClient.get(any())).thenAnswer((_) async => response);

        expect(
          api.getChampionDetails(championId),
          completion(
            isA<ChampionDetails>(),
          ),
        );
      });

      test('throws $HttpErrorResponse if status code is not 200', () async {
        final response = _MockResponse();
        when(() => response.statusCode).thenReturn(404);
        when(() => httpClient.get(any())).thenAnswer((_) async => response);
        expect(
          api.getChampionDetails(championId),
          throwsA(isA<HttpErrorResponse>()),
        );
      });

      test('throws $HttpMalformedResponse on invalid json', () async {
        final response = _MockResponse();
        when(() => response.statusCode).thenReturn(200);
        when(() => response.body).thenReturn('{');
        when(() => httpClient.get(any())).thenAnswer((_) async => response);
        expect(
          api.getChampionDetails(championId),
          throwsA(isA<HttpMalformedResponse>()),
        );
      });

      test('throws $HttpMalformedResponse on empty response', () async {
        final response = _MockResponse();
        when(() => response.statusCode).thenReturn(200);
        when(() => response.body).thenReturn('{}');
        when(() => httpClient.get(any())).thenAnswer((_) async => response);
        expect(
          api.getChampionDetails(championId),
          throwsA(isA<HttpMalformedResponse>()),
        );
      });

      test(
          'throws $HttpMalformedResponse if response body does not '
          'contain data key', () async {
        final response = _MockResponse();
        when(() => response.statusCode).thenReturn(200);
        when(() => response.body).thenReturn('{"test": "test"}');
        when(() => httpClient.get(any())).thenAnswer((_) async => response);
        expect(
          api.getChampionDetails(championId),
          throwsA(isA<HttpMalformedResponse>()),
        );
      });
    });
  });
}
