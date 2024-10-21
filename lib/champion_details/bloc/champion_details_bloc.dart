import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:champions_repository/champions_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:league_of_legends_api/league_of_legends_api.dart';

part 'champion_details_event.dart';
part 'champion_details_state.dart';

class ChampionDetailsBloc
    extends Bloc<ChampionDetailsEvent, ChampionDetailsState> {
  ChampionDetailsBloc({
    required this.championRepository,
  }) : super(const ChampionDetailsState()) {
    on<ChampionDetailsFetchRequested>(_fetchRequested);
  }

  final ChampionsRepository championRepository;

  Future<void> _fetchRequested(
    ChampionDetailsFetchRequested event,
    Emitter<ChampionDetailsState> emit,
  ) async {
    emit(state.copyWith(status: ChampionDetailsStatus.loading));
    try {
      final championDetails =
          await championRepository.getChampionDetails(event.championId);
      emit(
        state.copyWith(
          status: ChampionDetailsStatus.success,
          championDetails: championDetails,
        ),
      );
    } catch (_) {
      emit(state.copyWith(status: ChampionDetailsStatus.failure));
    }
  }
}
