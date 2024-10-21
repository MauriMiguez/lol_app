import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:league_of_legends_api/league_of_legends_api.dart';
import 'package:lol_app/champion_details/champion_details.dart';

import '../../helpers/helpers.dart';

void main() {
  group(SkinsCarousel, () {
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

    testWidgets('renders $Image', (tester) async {
      await tester.pumpApp(
        SkinsCarousel(
          skins: skins,
          onSkinSelected: (_) {},
        ),
      );

      expect(
        find.image(NetworkImage(skins.first.loadingImage)),
        findsOneWidget,
      );

      expect(
        find.image(NetworkImage(skins.last.loadingImage)),
        findsOneWidget,
      );
    });

    testWidgets('calls onSkinSelected when a $Skin is selected',
        (tester) async {
      var selected = false;
      await tester.pumpApp(
        SkinsCarousel(
          skins: skins,
          onSkinSelected: (_) => selected = true,
        ),
      );

      await tester.drag(find.byType(CarouselSlider), const Offset(-200, 0));
      await tester.pumpAndSettle();
      expect(selected, isTrue);
    });
  });
}
