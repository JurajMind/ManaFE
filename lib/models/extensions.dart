import 'package:app/app/app.dart';
import 'package:flutter/material.dart';
import 'package:openapi/api.dart';

class Extensions {
  static String getPlaceImage(PlaceSimpleDto place) {
    var image = place?.medias?.first?.path;
    if (image == null) {
      return 'https://${App.baseUri}/Content/Placeholder/place.jpg';
    }
    return 'https://${App.baseUri}${image}original.jpg';
  }

  static String adress(SmartHookahModelsAddress adress) {
    return '${adress.street} ${adress.number} ${adress.city}';
  }

  static String accesoryPicture(PipeAccesorySimpleDto accesory) {
    if (accesory.picture == null) {
      return "https://${App.baseUri}/Content/Placeholder/${accesory.type}.jpg";
    }
    return 'https://${App.baseUri}${accesory.picture}';
  }

  static String deviceVersion(int version) {
    var minor = version % 1000;
    version = version ~/ 1000;
    var major = version % 1000;
    version = version ~/ 1000;
    var whole = version;

    return "$whole.$major.$minor";
  }

  static String devicePicture(int type) {
    switch (type) {
      case 13:
        return 'images/devices/wood.jpg';
      case 12:
        return 'images/devices/wood.jpg';
      case 11:
        return 'images/devices/black.jpg';
      case 10:
        return 'images/devices/white.jpg';
    }
    return 'images/devices/prototype.jpg';
  }

  static List<Color> deviceAccentColor(int type) {
    switch (type) {
      case 13:
        return [
          Colors.transparent,
          Colors.blue,
        ];
      case 12:
        return [
          Colors.transparent,
          Colors.orangeAccent,
        ];
      case 11:
        return [
          Colors.transparent,
          Colors.grey,
        ];
      case 10:
        return [
          Colors.transparent,
          Colors.indigoAccent,
        ];
    }

    return [
      Colors.transparent,
      Colors.amber,
    ];
  }
}
