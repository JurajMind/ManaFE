import 'package:app/app/app.dart';
import 'package:app/module/module.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'services/authorization.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  getIt.registerLazySingletonAsync<SharedPreferences>(() async {
    return await SharedPreferences.getInstance();
  });
  GetIt.I.isReady<SharedPreferences>().then((_) {
    setup(getIt);
    var app = new App(
      environment: 'local',
      baseUri: 'smarthookah.azurewebsites.net',
      clientId: 'test',
      googleApiKey: '***REMOVED***',
    );
    app.run(runApp);
  });
}

final getIt = GetIt.instance;
void setup(GetIt getIt) {
  getIt.registerLazySingleton<PlacesBloc>(() => PlacesBloc()..loadPlaces());
  getIt.registerLazySingleton<PlaceBloc>(() => PlaceBloc());
  getIt.registerLazySingleton<AuthorizeRepository>(() =>
      AuthorizeRepository(sharedPreferences: getIt.get<SharedPreferences>()));
  getIt.registerLazySingleton<PersonBloc>(
      () => PersonBloc(getIt.get<AuthorizeRepository>()));
}
