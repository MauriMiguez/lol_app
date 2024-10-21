import 'package:champions_repository/champions_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lol_app/champion_details/champion_details.dart';

class ChampionDetailsPage extends StatelessWidget {
  const ChampionDetailsPage({
    required this.championId,
    super.key,
  });

  final String championId;

  static Route<void> route(String championId) {
    return MaterialPageRoute<void>(
      builder: (context) => ChampionDetailsPage(championId: championId),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChampionDetailsBloc(
        championRepository: context.read<ChampionsRepository>(),
      )..add(ChampionDetailsFetchRequested(championId: championId)),
      child: const ChampionDetailsView(),
    );
  }
}

class ChampionDetailsView extends StatelessWidget {
  @visibleForTesting
  const ChampionDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ChampionDetailsBloc, ChampionDetailsState>(
        builder: (context, state) {
          final championDetails = state.championDetails;
          return switch (state.status) {
            ChampionDetailsStatus.failure => const ChampionDetailsErrorView(),
            ChampionDetailsStatus.loading => const ChampionDetailsLoadingView(),
            ChampionDetailsStatus.success when championDetails != null =>
              ChampionDetailsLoadedView(championDetails: championDetails),
            ChampionDetailsStatus.success => const ChampionDetailsErrorView(),
          };
        },
      ),
    );
  }
}
