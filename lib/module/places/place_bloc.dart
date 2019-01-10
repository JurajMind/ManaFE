import 'package:app/app/app.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:openapi/api.dart';
import 'package:rxdart/rxdart.dart';
import 'package:location/location.dart';

class PlaceBloc {
  Location _location = new Location();
  bool _initLoad = false;

  BehaviorSubject<PlaceSimpleDto> place = new BehaviorSubject(seedValue: null);

  BehaviorSubject<PlaceDto> placeInfo = new BehaviorSubject(seedValue: null);

  static final PlaceBloc _instance = new PlaceBloc._();

  factory PlaceBloc() => PlaceBloc._instance;

  PlaceBloc._() {}

  Future loadPlace({PlaceSimpleDto place}) async {
    if (this.place.value == null || place.id != this.place.value.id) {
      placeInfo.add(null);
      this.place.add(place);
    }
    await App.http.getPlaceInfo(place.id).then((data) => placeInfo.add(data));
  }
}
