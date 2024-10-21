import 'package:flutter_test/flutter_test.dart';
import 'package:league_of_legends_api/league_of_legends_api.dart';
import 'package:lol_app/champion_details/champion_details.dart';

import '../../helpers/helpers.dart';

void main() {
  group(ChampionTitle, () {
    const championDetails = ChampionDetails(
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

    testWidgets('renders champion name', (tester) async {
      await tester.pumpApp(
        const ChampionTitle(championDetails: championDetails),
      );

      expect(find.text(championDetails.name.toUpperCase()), findsOneWidget);
    });

    testWidgets('renders champion title', (tester) async {
      await tester.pumpApp(
        const ChampionTitle(championDetails: championDetails),
      );

      expect(find.text(championDetails.title.toUpperCase()), findsOneWidget);
    });
  });
}
