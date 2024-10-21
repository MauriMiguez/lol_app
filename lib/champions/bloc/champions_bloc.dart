import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:champions_repository/champions_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:league_of_legends_api/league_of_legends_api.dart';

part 'champions_event.dart';
part 'champions_state.dart';

class ChampionsBloc extends Bloc<ChampionsEvent, ChampionsState> {
  ChampionsBloc({
    required this.championRepository,
  }) : super(const ChampionsState()) {
    on<ChampionsFetchRequested>(_fetchRequested);
  }

  final ChampionsRepository championRepository;

  Future<void> _fetchRequested(
    ChampionsFetchRequested event,
    Emitter<ChampionsState> emit,
  ) async {
    emit(state.copyWith(status: ChampionsStatus.loading));
    try {
      final champions = await championRepository.getChampions();
      emit(
        state.copyWith(
          status: ChampionsStatus.success,
          champions: champions,
        ),
      );
    } catch (_) {
      emit(state.copyWith(status: ChampionsStatus.failure));
    }
  }
}
