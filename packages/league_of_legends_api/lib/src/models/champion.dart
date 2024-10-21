import 'package:league_of_legends_api/src/api_paths.dart';

/// {@template champion}
/// [Champion] fetched from League of Legends API
///
/// A champion is an in game character.
/// attributes.
/// {@endtemplate}
class Champion {
  /// {@macro champion}
  const Champion({
    required this.id,
    required this.name,
    required this.squareImage,
  });

  /// Json deserialize
  factory Champion.fromJson(Map<String, dynamic> json) {
    final imageJson = json['image'] as Map<String, dynamic>;

    return Champion(
      id: json['id'] as String,
      name: json['name'] as String,
      squareImage: '$championSquareImagePath${imageJson['full'] as String}',
    );
  }

  /// Id of the champion
  final String id;

  /// Name of the champion
  final String name;

  /// Square image of the champion
  final String squareImage;
}
