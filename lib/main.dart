import 'package:app/app/app.dart';
import 'package:flutter/material.dart';

void main() {
  new App(
    environment: 'local',
    baseUri: 'smarthookah.azurewebsites.net',
    clientId: 'test',
    googleApiKey: '***REMOVED***',
  ).run(runApp);
}
