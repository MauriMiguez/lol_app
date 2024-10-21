import 'package:champions_repository/champions_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lol_app/app/view/app.dart';
import 'package:lol_app/champions/champions.dart';
import 'package:mocktail/mocktail.dart';

class MockChampionsRepository extends Mock implements ChampionsRepository {}

void main() {
  group('App', () {
    late ChampionsRepository championsRepository;

    setUp(() {
      championsRepository = MockChampionsRepository();
    });

    testWidgets('renders ChampionsPage', (tester) async {
      await tester.pumpWidget(
        App(championRepository: championsRepository),
      );
      expect(find.byType(ChampionsPage), findsOneWidget);
    });
  });
}
