import 'package:app/app/app.dart';
import 'package:app/injection/dependency_injection.dart';
import 'package:flutter/material.dart';
import 'package:onesignal/onesignal.dart';

void main() {
  Injector.configure(Flavor.PRO);

  OneSignal.shared.init("f3335ca8-8fc9-4e91-b9f8-324717b86d3c");
  OneSignal.shared.setLogLevel(OSLogLevel.debug, OSLogLevel.debug);
  OneSignal.shared
      .promptUserForPushNotificationPermission(fallbackToSettings: true);
  new App(
    environment: 'local',
    baseUri: 'app.manapipes.com',
    clientId: 'test',
    googleApiKey: '***REMOVED***',
  ).run(runApp);
}
