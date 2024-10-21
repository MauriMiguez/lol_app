part of 'champion_details_bloc.dart';

enum ChampionDetailsStatus {
  loading,
  success,
  failure,
}

class ChampionDetailsState extends Equatable {
  const ChampionDetailsState({
    this.status = ChampionDetailsStatus.loading,
    this.championDetails,
  });

  final ChampionDetails? championDetails;
  final ChampionDetailsStatus status;

  ChampionDetailsState copyWith({
    ChampionDetailsStatus? status,
    ChampionDetails? championDetails,
  }) {
    return ChampionDetailsState(
      status: status ?? this.status,
      championDetails: championDetails ?? this.championDetails,
    );
  }

  @override
  List<Object?> get props => [championDetails, status];
}
