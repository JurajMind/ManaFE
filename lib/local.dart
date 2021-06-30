import 'package:app/app/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  new App(
          environment: 'local',
          baseUri: '192.168.2.204:45455',
          googleApiKey: '***REMOVED***',
          clientId: 'test')
      .run(runApp);
}
