import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:league_of_legends_api/league_of_legends_api.dart';
import 'package:lol_app/champion_details/champion_details.dart';
import 'package:lol_app/champions/champions.dart';
import 'package:mocktail/mocktail.dart';

import '../../helpers/helpers.dart';

class _MockChampionsBloc extends MockBloc<ChampionsEvent, ChampionsState>
    implements ChampionsBloc {}

void main() {
  group(ChampionsLoadedView, () {
    late ChampionsBloc championBloc;

    const champion = Champion(
      id: '1',
      name: 'name',
      squareImage: 'image',
    );

    const champions = [champion];

    setUp(() {
      championBloc = _MockChampionsBloc();
    });

    testWidgets('renders $GridView', (tester) async {
      when(() => championBloc.state).thenReturn(
        const ChampionsState(
          status: ChampionsStatus.success,
          champions: champions,
        ),
      );
      await tester.pumpApp(
        BlocProvider.value(
          value: championBloc,
          child: const ChampionsView(),
        ),
      );

      expect(find.byType(GridView), findsOneWidget);
    });

    testWidgets('navigates to $ChampionDetailsPage when clicking on champion',
        (tester) async {
      when(() => championBloc.state).thenReturn(
        const ChampionsState(
          status: ChampionsStatus.success,
          champions: champions,
        ),
      );
      await tester.pumpApp(
        BlocProvider.value(
          value: championBloc,
          child: const ChampionsView(),
        ),
      );

      await tester.tap(find.byType(ChampionItemView));
      await tester.pumpAndSettle();

      expect(find.byType(ChampionsLoadedView), findsNothing);
      expect(find.byType(ChampionDetailsPage), findsOneWidget);
    });
  });
}
