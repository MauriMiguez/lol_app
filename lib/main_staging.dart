// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:champions_repository/champions_repository.dart';
import 'package:league_of_legends_api/league_of_legends_api.dart';
import 'package:lol_app/app/view/app.dart';
import 'package:lol_app/bootstrap.dart';

void main() {
  final leagueOfLegendsApi = LeagueOfLegendsApi();
  final championRepository = ChampionsRepository(
    leagueOfLegendsApi: leagueOfLegendsApi,
  );

  bootstrap(
    () => App(
      championRepository: championRepository,
    ),
  );
}
