import 'package:league_of_legends_api/league_of_legends_api.dart';

/// {@template champion_details}
/// [ChampionDetails] fetched from League of Legends API.
///
/// Has the details of a champion including their [Skin].
/// {@endtemplate}
class ChampionDetails {
  /// {@macro champion_details}
  const ChampionDetails({
    required this.id,
    required this.name,
    required this.title,
    required this.skins,
  });

  /// Json deserialize
  factory ChampionDetails.fromJson(Map<String, dynamic> json) {
    final id = json['id'] as String;
    return ChampionDetails(
      id: id,
      name: json['name'] as String,
      title: json['title'] as String,
      skins: (json['skins'] as List<dynamic>)
          .map(
            (skin) =>
                Skin.fromJson(skin as Map<String, dynamic>, championId: id),
          )
          .toList(),
    );
  }

  /// Id of the champion
  final String id;

  /// Name of the champion
  final String name;

  /// Title of the champion
  final String title;

  /// Skins of the champion
  final List<Skin> skins;
}
