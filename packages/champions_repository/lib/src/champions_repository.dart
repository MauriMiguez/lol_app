import 'package:champions_repository/champions_repository.dart';
import 'package:league_of_legends_api/league_of_legends_api.dart';

/// {@template champions_repository}
/// Dart package for the champion domain
/// {@endtemplate}
class ChampionsRepository {
  /// {@macro champions_repository}
  const ChampionsRepository({
    required LeagueOfLegendsApi leagueOfLegendsApi,
  }) : _leagueOfLegendsApi = leagueOfLegendsApi;

  final LeagueOfLegendsApi _leagueOfLegendsApi;

  /// Return List of [Champion]
  ///
  /// Throws [GetChampionsFailure] if an error occurs
  Future<List<Champion>> getChampions() async {
    try {
      final champions = await _leagueOfLegendsApi.getChampions();

      return champions;
    } catch (_) {
      throw GetChampionsFailure();
    }
  }

  /// Return [ChampionDetails]
  ///
  /// Throws [GetChampionDetailsFailure] if an error occurs
  Future<ChampionDetails> getChampionDetails(String championId) async {
    try {
      return await _leagueOfLegendsApi.getChampionDetails(championId);
    } catch (_) {
      throw GetChampionDetailsFailure();
    }
  }
}
