// ignore_for_file: prefer_const_constructors, lines_longer_than_80_chars
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:league_of_legends_api/league_of_legends_api.dart';
import 'package:lol_app/champion_details/champion_details.dart';
import 'package:mocktail/mocktail.dart';

import '../../helpers/helpers.dart';

class _MockChampionDetailsBloc
    extends MockBloc<ChampionDetailsEvent, ChampionDetailsState>
    implements ChampionDetailsBloc {}

void main() {
  group(ChampionDetailsPage, () {
    testWidgets('displays a $ChampionDetailsView', (tester) async {
      await tester.pumpApp(ChampionDetailsPage(championId: 'id'));

      expect(find.byType(ChampionDetailsView), findsOneWidget);
    });
  });

  group(ChampionDetailsView, () {
    late ChampionDetailsBloc championBloc;

    const championDetails = ChampionDetails(
      id: '1',
      name: 'Aatrox',
      title: 'The Darkin Blade',
      skins: [
        Skin(
          id: '1',
          name: 'Aatrox',
          splashImage: 'splashImage',
          loadingImage: 'loadingImage',
        ),
      ],
    );

    setUp(() {
      championBloc = _MockChampionDetailsBloc();
    });

    testWidgets(
        'displays $ChampionDetailsLoadingView when ${ChampionDetailsStatus.loading}',
        (tester) async {
      when(() => championBloc.state).thenReturn(ChampionDetailsState());
      await tester.pumpApp(
        BlocProvider.value(
          value: championBloc,
          child: ChampionDetailsView(),
        ),
      );
      expect(find.byType(ChampionDetailsLoadingView), findsOneWidget);
    });

    testWidgets(
        'displays $ChampionDetailsErrorView when ${ChampionDetailsStatus.failure}',
        (tester) async {
      when(() => championBloc.state).thenReturn(
        ChampionDetailsState(status: ChampionDetailsStatus.failure),
      );
      await tester.pumpApp(
        BlocProvider.value(
          value: championBloc,
          child: ChampionDetailsView(),
        ),
      );
      expect(find.byType(ChampionDetailsErrorView), findsOneWidget);
    });

    testWidgets(
        'displays $ChampionDetailsLoadedView when '
        '${ChampionDetailsStatus.success} with champion', (tester) async {
      when(() => championBloc.state).thenReturn(
        ChampionDetailsState(
          status: ChampionDetailsStatus.success,
          championDetails: championDetails,
        ),
      );

      await tester.pumpApp(
        BlocProvider.value(
          value: championBloc,
          child: ChampionDetailsView(),
        ),
      );
      expect(find.byType(ChampionDetailsLoadedView), findsOneWidget);
    });
  });
}
