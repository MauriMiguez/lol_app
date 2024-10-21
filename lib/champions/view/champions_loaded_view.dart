import 'package:flutter/material.dart';
import 'package:league_of_legends_api/league_of_legends_api.dart';
import 'package:lol_app/champion_details/champion_details.dart';

class ChampionsLoadedView extends StatelessWidget {
  const ChampionsLoadedView({
    required this.champions,
    super.key,
  });

  final List<Champion> champions;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 24,
        crossAxisSpacing: 24,
      ),
      itemBuilder: (context, index) => ChampionItemView(
        champion: champions[index],
      ),
      itemCount: champions.length,
    );
  }
}

class ChampionItemView extends StatelessWidget {
  @visibleForTesting
  const ChampionItemView({
    required this.champion,
    super.key,
  });

  final Champion champion;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context)
          .push<void>(ChampionDetailsPage.route(champion.id)),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFF9f8850), width: 2),
        ),
        child: Image.network(champion.squareImage),
      ),
    );
  }
}
