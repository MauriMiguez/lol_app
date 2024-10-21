import 'package:flutter/material.dart';
import 'package:league_of_legends_api/league_of_legends_api.dart';
import 'package:lol_app/champion_details/champion_details.dart';

class ChampionDetailsLoadedView extends StatefulWidget {
  const ChampionDetailsLoadedView({
    required this.championDetails,
    super.key,
  });

  final ChampionDetails championDetails;

  @override
  State<ChampionDetailsLoadedView> createState() =>
      _ChampionDetailsLoadedViewState();
}

class _ChampionDetailsLoadedViewState extends State<ChampionDetailsLoadedView> {
  int selectedImage = 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    for (final skin in widget.championDetails.skins) {
      precacheImage(
        NetworkImage(skin.loadingImage),
        context,
      );
      precacheImage(
        NetworkImage(skin.splashImage),
        context,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final skins = widget.championDetails.skins;
    final selectedSkin = skins[selectedImage];

    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ChampionTitle(championDetails: widget.championDetails),
          ),
          Expanded(
            child: Image.network(
              selectedSkin.splashImage,
              fit: BoxFit.fitHeight,
            ),
          ),
          const SizedBox(height: 16),
          Center(child: _SkinTitle(name: selectedSkin.name)),
          const SizedBox(height: 16),
          Row(
            children: [
              const Expanded(child: Divider()),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: DotsIndicator(
                  length: skins.length,
                  currentIndex: selectedImage,
                ),
              ),
              const Expanded(child: Divider()),
            ],
          ),
          const SizedBox(height: 8),
          SkinsCarousel(
            skins: widget.championDetails.skins,
            onSkinSelected: (index) {
              setState(() {
                selectedImage = index;
              });
            },
          ),
        ],
      ),
    );
  }
}

class _SkinTitle extends StatelessWidget {
  const _SkinTitle({required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Text(
      name,
      style: textTheme.titleLarge?.copyWith(
        fontStyle: FontStyle.italic,
        color: Colors.white,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
