import 'package:app/app/app.dart';
import 'package:app/injection/dependency_injection.dart';
import 'package:flutter/material.dart';

void main() {
  Injector.configure(Flavor.PRO);

  new App(
          environment: 'dev',
          baseUri: 'devmana.azurewebsites.net',
          clientId: 'test')
      .run(runApp);
}
