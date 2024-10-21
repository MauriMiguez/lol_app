import 'package:flutter/material.dart';
import 'package:league_of_legends_api/league_of_legends_api.dart';

class ChampionTitle extends StatelessWidget {
  const ChampionTitle({
    required this.championDetails,
    super.key,
  });

  final ChampionDetails championDetails;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      decoration: const BoxDecoration(
        color: Color(0xFF010a13),
        border: Border(
          top: BorderSide(color: Color(0xFF9f8850), width: 2),
          bottom: BorderSide(color: Color(0xFF9f8850), width: 2),
        ),
      ),
      child: Column(
        children: [
          Text(
            championDetails.name.toUpperCase(),
            style: textTheme.titleLarge?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            championDetails.title.toUpperCase(),
            style: textTheme.titleMedium?.copyWith(
              color: const Color(0xFF9f8850),
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
