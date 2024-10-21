import 'package:champions_repository/champions_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lol_app/champions/champions.dart';

class ChampionsPage extends StatelessWidget {
  const ChampionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChampionsBloc(
        championRepository: context.read<ChampionsRepository>(),
      )..add(ChampionsFetchRequested()),
      child: const ChampionsView(),
    );
  }
}

class ChampionsView extends StatelessWidget {
  @visibleForTesting
  const ChampionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ChampionsBloc, ChampionsState>(
        builder: (context, state) {
          return switch (state.status) {
            ChampionsStatus.failure => const ChampionsErrorView(),
            ChampionsStatus.loading => const ChampionsLoadingView(),
            ChampionsStatus.success =>
              ChampionsLoadedView(champions: state.champions)
          };
        },
      ),
    );
  }
}
