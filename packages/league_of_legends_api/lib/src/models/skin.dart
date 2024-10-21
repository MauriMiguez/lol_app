import 'package:league_of_legends_api/src/api_paths.dart';

/// {@template skin}
/// [Skin] fetched from League of Legends API
///
/// A skin is a cosmetic change to the appearance of a champion.
/// {@endtemplate}
class Skin {
  /// {@macro skin}
  const Skin({
    required this.id,
    required this.name,
    required this.loadingImage,
    required this.splashImage,
  });

  /// Json deserialize
  factory Skin.fromJson(
    Map<String, dynamic> json, {
    required String championId,
  }) {
    final num = json['num'] as int;

    return Skin(
      id: json['id'] as String,
      name: json['name'] as String,
      loadingImage: '$championLoadingImagePath${championId}_$num.jpg',
      splashImage: '$championSplashImagePath${championId}_$num.jpg',
    );
  }

  /// Id of the skin
  final String id;

  /// Name of the skin
  final String name;

  /// Loading image of the skin
  final String loadingImage;

  /// Splash image of the skin
  final String splashImage;
}
