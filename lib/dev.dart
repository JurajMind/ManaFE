import 'package:app/app/app.dart';

import 'package:flutter/material.dart';

void main() {
  new App(
          environment: 'dev',
          baseUri: 'devmana.azurewebsites.net',
          googleApiKey: '***REMOVED***',
          clientId: 'test')
      .run(runApp);
}
