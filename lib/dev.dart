import 'package:app/app/app.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  new App(
          environment: 'dev',
          baseUri: 'devmana.azurewebsites.net',
          googleApiKey: '***REMOVED***',
          clientId: 'test')
      .run(runApp);
}
