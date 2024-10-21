import 'package:champions_repository/champions_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lol_app/l10n/l10n.dart';
import 'package:mocktail/mocktail.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';

class MockChampionsRepository extends Mock implements ChampionsRepository {}

extension PumpApp on WidgetTester {
  Future<void> pumpApp(
    Widget widget, {
    ChampionsRepository? championRepository,
  }) {
    return mockNetworkImages(
      () {
        return pumpWidget(
          MultiRepositoryProvider(
            providers: [
              RepositoryProvider.value(
                value: championRepository ?? MockChampionsRepository(),
              ),
            ],
            child: MaterialApp(
              localizationsDelegates: const [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
              ],
              supportedLocales: AppLocalizations.supportedLocales,
              home: widget,
            ),
          ),
        );
      },
    );
  }
}
