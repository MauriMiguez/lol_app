import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:league_of_legends_api/league_of_legends_api.dart';
import 'package:lol_app/champion_details/champion_details.dart';

import '../../helpers/helpers.dart';

void main() {
  group(ChampionDetailsLoadedView, () {
    const skins = [
      Skin(
        id: '1',
        name: 'Aatrox',
        splashImage: 'aatroxSplashImage',
        loadingImage: 'aatroxLoadingImage',
      ),
      Skin(
        id: '2',
        name: 'Nasus',
        splashImage: 'nasusSplashImage',
        loadingImage: 'nasusLoadingImage',
      ),
    ];

    const championDetails = ChampionDetails(
      id: '1',
      name: 'Aatrox',
      title: 'The Darkin Blade',
      skins: skins,
    );

    group('renders', () {
      testWidgets('$ChampionTitle', (tester) async {
        await tester.pumpApp(
          const ChampionDetailsLoadedView(championDetails: championDetails),
        );

        expect(find.byType(ChampionTitle), findsOneWidget);
      });

      testWidgets('champion Splash Image', (tester) async {
        await tester.pumpApp(
          const ChampionDetailsLoadedView(championDetails: championDetails),
        );

        expect(
          find.image(NetworkImage(skins.first.splashImage)),
          findsOneWidget,
        );
      });

      testWidgets('$SkinsCarousel', (tester) async {
        await tester.pumpApp(
          const ChampionDetailsLoadedView(championDetails: championDetails),
        );

        expect(find.byType(SkinsCarousel), findsOneWidget);
      });

      testWidgets('$DotsIndicator', (tester) async {
        await tester.pumpApp(
          const ChampionDetailsLoadedView(championDetails: championDetails),
        );

        expect(find.byType(DotsIndicator), findsOneWidget);
      });

      testWidgets('skin title', (tester) async {
        await tester.pumpApp(
          const ChampionDetailsLoadedView(championDetails: championDetails),
        );

        expect(find.text(championDetails.skins.first.name), findsOneWidget);
      });
    });

    testWidgets('changes skin title when selected image changes',
        (tester) async {
      await tester.pumpApp(
        const ChampionDetailsLoadedView(championDetails: championDetails),
      );

      await tester.drag(find.byType(CarouselSlider), const Offset(-200, 0));
      await tester.pumpAndSettle();

      expect(find.text(championDetails.skins.first.name), findsNothing);
      expect(find.text(championDetails.skins.last.name), findsOneWidget);
    });

    testWidgets('changes splash image when selected image changes',
        (tester) async {
      await tester.pumpApp(
        const ChampionDetailsLoadedView(championDetails: championDetails),
      );

      await tester.drag(find.byType(CarouselSlider), const Offset(-200, 0));
      await tester.pumpAndSettle();

      expect(
        find.image(NetworkImage(skins.first.splashImage)),
        findsNothing,
      );
      expect(
        find.image(NetworkImage(skins.last.splashImage)),
        findsOneWidget,
      );
    });
  });
}
