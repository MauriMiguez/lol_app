import 'dart:convert';

import 'package:http/http.dart';
import 'package:league_of_legends_api/league_of_legends_api.dart';
import 'package:league_of_legends_api/src/api_paths.dart';

/// {@template league_of_legends_api}
/// A Dart client for the Data Dragon League of Legends API
/// {@endtemplate}
class LeagueOfLegendsApi {
  /// {@macro league_of_legends_api}
  LeagueOfLegendsApi({Client? httpClient})
      : _httpClient = httpClient ?? Client();

  final Client _httpClient;
  static const _baseUrl = dataDragonUrl;

  /// Return List of [Champion]
  Future<List<Champion>> getChampions() async {
    final url = Uri.https(_baseUrl, championPath);
    final response = await _httpClient.get(url);

    if (response.statusCode != 200) {
      throw HttpErrorResponse(
        url: url,
        statusCode: response.statusCode,
      );
    }

    try {
      final championsJson = jsonDecode(response.body) as Map<String, dynamic>;
      final champions = (championsJson['data'] as Map<String, dynamic>)
          .entries
          .map(
            (entry) => Champion.fromJson(entry.value as Map<String, dynamic>),
          )
          .toList();
      return champions;
    } catch (e) {
      throw HttpMalformedResponse();
    }
  }

  /// Return [ChampionDetails] for a given [championId]
  Future<ChampionDetails> getChampionDetails(String championId) async {
    final path = '$championDetailsPath$championId.json';

    final url = Uri.https(_baseUrl, path);
    final response = await _httpClient.get(url);

    if (response.statusCode != 200) {
      throw HttpErrorResponse(
        url: url,
        statusCode: response.statusCode,
      );
    }

    try {
      final championDetailsJson =
          jsonDecode(response.body) as Map<String, dynamic>;
      final championsDetailsData =
          championDetailsJson['data'] as Map<String, dynamic>;
      final championDetails = ChampionDetails.fromJson(
        championsDetailsData.values.first as Map<String, dynamic>,
      );

      return championDetails;
    } catch (e) {
      throw HttpMalformedResponse();
    }
  }
}
