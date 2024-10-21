part of 'champion_details_bloc.dart';

abstract class ChampionDetailsEvent extends Equatable {
  const ChampionDetailsEvent({required this.championId});

  final String championId;

  @override
  List<Object> get props => [];
}

class ChampionDetailsFetchRequested extends ChampionDetailsEvent {
  const ChampionDetailsFetchRequested({required super.championId});
}
