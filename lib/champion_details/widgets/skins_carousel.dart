import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:league_of_legends_api/league_of_legends_api.dart';

class SkinsCarousel extends StatelessWidget {
  const SkinsCarousel({
    required this.skins,
    required this.onSkinSelected,
    super.key,
  });

  final void Function(int index) onSkinSelected;

  final List<Skin> skins;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: skins.length,
      itemBuilder: (context, index, realIndex) =>
          Image.network(skins[index].loadingImage),
      options: CarouselOptions(
        viewportFraction: 0.4,
        height: 320,
        enlargeCenterPage: true,
        enableInfiniteScroll: false,
        onPageChanged: (index, _) => onSkinSelected(index),
      ),
    );
  }
}
