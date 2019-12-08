import 'package:app/app/app.dart';
import 'package:flutter/material.dart';

void main() {
  new App(
          environment: 'local',
          baseUri: '192.168.2.204:45455',
          googleApiKey: '***REMOVED***',
          clientId: 'test')
      .run(runApp);
}
