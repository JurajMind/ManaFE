import 'package:app/utils/translations/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:openapi/openapi.dart';
import 'package:url_launcher/url_launcher.dart';

class TaxiButton extends StatelessWidget {
  final PlaceSimpleDto? place;

  const TaxiButton({Key? key, this.place}) : super(key: key);

  void navigate() async {
    var lat = double.parse(place!.address!.lat!);
    var lng = double.parse(place!.address!.lng!);
    final url = 'geo:$lat,$lng';
    if (await canLaunch(url)) {
      await launch(url, forceSafariVC: false);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Text(
        AppTranslations.of(context)!.text("place.go_with_taxi").toUpperCase(),
        style: TextStyle(color: Colors.black),
      ),
      onPressed: () => navigate(),
    );
  }
}
