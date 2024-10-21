part of 'champions_bloc.dart';

abstract class ChampionsEvent extends Equatable {
  const ChampionsEvent();

  @override
  List<Object> get props => [];
}

class ChampionsFetchRequested extends ChampionsEvent {}
