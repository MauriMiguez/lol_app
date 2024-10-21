part of 'champions_bloc.dart';

enum ChampionsStatus {
  loading,
  success,
  failure,
}

class ChampionsState extends Equatable {
  const ChampionsState({
    this.status = ChampionsStatus.loading,
    this.champions = const [],
  });

  final List<Champion> champions;
  final ChampionsStatus status;

  ChampionsState copyWith({
    ChampionsStatus? status,
    List<Champion>? champions,
  }) {
    return ChampionsState(
      status: status ?? this.status,
      champions: champions ?? this.champions,
    );
  }

  @override
  List<Object> get props => [champions, status];
}
