import 'package:app/app/app.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:openapi/api.dart';
import 'package:rxdart/rxdart.dart';

class PlaceBloc {
  bool _initLoad = false;
  PlaceSimpleDto _place;

  BehaviorSubject<PlaceSimpleDto> place = new BehaviorSubject();

  BehaviorSubject<PlaceDto> placeInfo = new BehaviorSubject();

  BehaviorSubject<List<ReservationsTimeSlot>> reservationInfo =
      new BehaviorSubject();

  static final PlaceBloc _instance = new PlaceBloc._();

  factory PlaceBloc() => PlaceBloc._instance;

  PlaceBloc._() {}

  Future loadPlace({PlaceSimpleDto place}) async {
    _place = place;
    if (this.place.value == null || place.id != this.place.value.id) {
      placeInfo.add(null);
      this.place.add(place);
    }
    var placeInfoTask =
        App.http.getPlaceInfo(place.id).then((data) => placeInfo.add(data));
    var placeReservationTask = loadReservationInfo(DateTime.now());

    await Future.wait([placeInfoTask, placeReservationTask]);
  }

  Future loadReservationInfo(DateTime date) async {
    await App.http
        .getPlaceReservationInfo(_place.id, date)
        .then((data) => reservationInfo.add(data.timeSlots));
  }
}
