import 'package:flutter/material.dart';
import 'package:lol_app/l10n/l10n.dart';

class ChampionsErrorView extends StatelessWidget {
  const ChampionsErrorView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Center(
      child: Text(l10n.errorViewMessage),
    );
  }
}
