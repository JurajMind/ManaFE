import 'package:app/app/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  new App(
    environment: 'local',
    baseUri: 'smarthookah.azurewebsites.net',
    clientId: 'test',
    googleApiKey: '***REMOVED***',
  ).run(runApp);
}
