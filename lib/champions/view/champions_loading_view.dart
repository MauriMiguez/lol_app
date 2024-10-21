import 'package:flutter/material.dart';

class ChampionsLoadingView extends StatelessWidget {
  const ChampionsLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}
