import 'package:flutter/material.dart';

class ChampionDetailsLoadingView extends StatelessWidget {
  const ChampionDetailsLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}
