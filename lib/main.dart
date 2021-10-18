import 'package:app/app/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'module/person/person_bloc.dart';
import 'services/authorization.dart';

Future<void> main() async {
  setup();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  new App(
    environment: 'local',
    baseUri: 'smarthookah.azurewebsites.net',
    clientId: 'test',
    googleApiKey: '***REMOVED***',
  ).run(runApp);
}

final getIt = GetIt.instance;

void setup() {
  getIt.registerLazySingleton<AuthorizeRepository>(() => AuthorizeRepository());
  getIt.registerLazySingleton<PersonBloc>(
      () => PersonBloc(getIt.get<AuthorizeRepository>()));
}
