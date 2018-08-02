import 'package:app/app/app.dart';
import 'package:flutter/material.dart';

void main() {
  new App(
    environment: 'production',
    baseUri: 'app.manapipes.com',
    clientId: 'test'
  ).run(runApp);
}