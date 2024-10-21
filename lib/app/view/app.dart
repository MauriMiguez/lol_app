// Copyright (c) 2021, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:champions_repository/champions_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:lol_app/champions/champions.dart';
import 'package:lol_app/l10n/l10n.dart';

class App extends StatelessWidget {
  const App({
    required ChampionsRepository championRepository,
    super.key,
  }) : _championsRepository = championRepository;

  final ChampionsRepository _championsRepository;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: _championsRepository),
      ],
      child: MaterialApp(
        theme: ThemeData(
          useMaterial3: true,
          scaffoldBackgroundColor: const Color(0xFF010a13),
          progressIndicatorTheme: const ProgressIndicatorThemeData(
            color: Color(0xFF9f8850),
          ),
          dividerTheme: const DividerThemeData(
            color: Color(0xFF9f8850),
          ),
        ),
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
        ],
        supportedLocales: AppLocalizations.supportedLocales,
        home: const ChampionsPage(),
      ),
    );
  }
}
