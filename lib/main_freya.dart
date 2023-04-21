import 'package:alice_lightweight/alice.dart';
import 'package:app/app/app.dart';
import 'package:app/module/module.dart';
import 'package:app/module/smokeSession/smoke_session_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app/app.widget_freya.dart';
import 'models/Hive/hive.dart';
import 'services/authorization.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  getIt.registerLazySingletonAsync<SharedPreferences>(() async {
    return await SharedPreferences.getInstance();
  });
  GetIt.I.isReady<SharedPreferences>().then((_) async {
    await setup(getIt);
    var app = new App(
        environment: 'local',
        baseUri: 'smarthookah.azurewebsites.net',
        clientId: 'test',
        googleApiKey: '***REMOVED***',
        facebookClientId: '1107199546054049',
        appType: AppType.freya);

    await Firebase.initializeApp();
    runApp(FreyaAppWidget());
  });
}

final getIt = GetIt.instance;
Future<void> setup(GetIt getIt) async {
  var hive = Hive;
  await hive.initFlutter();
  hive
    ..registerAdapter(PlaceSimpleDtoAdapter())
    ..registerAdapter(AddressDtoAdapter())
    ..registerAdapter(TobaccoMixSimpleDtoAdapter())
    ..registerAdapter(PipeAccesorySimpleDtoAdapter());
  getIt.registerLazySingleton<Alice>(() => Alice(
        darkTheme: true,
      ));
  getIt.registerLazySingleton<PlacesBloc>(() => PlacesBloc());
  getIt.registerLazySingleton<PlaceBloc>(() => PlaceBloc());
  getIt.registerLazySingleton<SmokeSessionBloc>(() => SmokeSessionBloc());
  getIt.registerLazySingleton<AuthorizeRepository>(
      () => AuthorizeRepository(sharedPreferences: getIt.get<SharedPreferences>()));
  getIt.registerLazySingleton<PersonBloc>(() => PersonBloc(getIt.get<AuthorizeRepository>()));
}
