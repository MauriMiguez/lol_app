// ignore_for_file: prefer_const_constructors
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:league_of_legends_api/league_of_legends_api.dart';
import 'package:lol_app/champions/champions.dart';
import 'package:mocktail/mocktail.dart';

import '../../helpers/helpers.dart';

class _MockChampionsBloc extends MockBloc<ChampionsEvent, ChampionsState>
    implements ChampionsBloc {}

void main() {
  group(ChampionsPage, () {
    testWidgets('displays a $ChampionsView', (tester) async {
      await tester.pumpApp(ChampionsPage());
      expect(find.byType(ChampionsView), findsOneWidget);
    });
  });

  group(ChampionsView, () {
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

    testWidgets(
        'displays $ChampionsLoadingView when ${ChampionsStatus.loading}',
        (tester) async {
      when(() => championBloc.state).thenReturn(ChampionsState());
      await tester.pumpApp(
        BlocProvider.value(
          value: championBloc,
          child: ChampionsView(),
        ),
      );
      expect(find.byType(ChampionsLoadingView), findsOneWidget);
    });

    testWidgets('displays $ChampionsErrorView when ${ChampionsStatus.failure}',
        (tester) async {
      when(() => championBloc.state).thenReturn(
        ChampionsState(status: ChampionsStatus.failure),
      );
      await tester.pumpApp(
        BlocProvider.value(
          value: championBloc,
          child: ChampionsView(),
        ),
      );
      expect(find.byType(ChampionsErrorView), findsOneWidget);
    });

    testWidgets(
        'displays $ChampionsLoadedView when '
        '${ChampionsStatus.success} with champion', (tester) async {
      when(() => championBloc.state).thenReturn(
        ChampionsState(
          status: ChampionsStatus.success,
          champions: champions,
        ),
      );
      await tester.pumpApp(
        BlocProvider.value(
          value: championBloc,
          child: ChampionsView(),
        ),
      );
      expect(find.byType(ChampionsLoadedView), findsOneWidget);
    });
  });
}
