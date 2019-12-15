import 'package:app/app/app.dart';
import 'package:flutter/material.dart';
import 'package:easy_google_maps/easy_google_maps.dart';

class MapTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Easy Google Maps'),
        ),
        body: EasyGoogleMaps(
          apiKey: App.googleApiKeys,
          address: 'Infinite Loop, Cupertino, CA 95014',
          title: 'Apple Campus',
        ),
      ),
    );
  }
}
