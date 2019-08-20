import 'dart:io';

import 'package:app/app/app.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:openapi/api.dart';
import 'package:rxdart/rxdart.dart';

class PlaceBloc {
  bool _initLoad = false;
  PlaceSimpleDto _place;
  static const pageSize = 10;

  BehaviorSubject<PlaceSimpleDto> place = new BehaviorSubject();

  BehaviorSubject<PlaceDto> placeInfo = new BehaviorSubject();

  BehaviorSubject<List<PlacesPlaceReviewDto>> reviews = new BehaviorSubject();

  BehaviorSubject<List<ReservationsTimeSlot>> reservationInfo =
      new BehaviorSubject();

  int lastPage = 0;
  BehaviorSubject<bool> haveMoreReviews = new BehaviorSubject.seeded(true);

  static final PlaceBloc _instance = new PlaceBloc._();

  factory PlaceBloc() => PlaceBloc._instance;

  PlaceBloc._() {}

  Future loadPlace({PlaceSimpleDto place}) async {
    _place = place;
    if (this.place.value == null || place.id != this.place.value.id) {
      placeInfo.add(null);
      this.place.add(place);
    }
    await App.http.getPlaceInfo(place.id).then((data) {
      placeInfo.add(data);
      reviews.add(data.placeReviews);
    });
  }

  Future loadReview({force = false}) async {
    if (!haveMoreReviews.value && !force) return;

    await App.http
        .getPlaceReview(_place.id, page: lastPage + 1, pageSize: pageSize)
        .then((data) {
      if (data.length < pageSize) {
        haveMoreReviews.add(false);
        var oldData = reviews.value;
        oldData.addAll(data);
        reviews.add(oldData);
      }
    });
  }

  Future addReview(int placeId, PlacesPlaceReviewDto review,
      {List<File> media}) async {
    var newReview = await App.http.addPlaceReview(placeId, review);
    var mediaDto = new List<MediaDto>();
    if (media != null && media.length > 0) {
      media.forEach((f) async {
        try {
          mediaDto.add(await App.http.uploadPlaceReviewFile(newReview.id, f));
        } catch (_) {}
      });
    }
    newReview.medias = mediaDto;
    var oldData = reviews.value;
    oldData.insert(0, newReview);
    reviews.add(oldData);
  }

  Future loadReservationInfo(DateTime date) async {
    await App.http
        .getPlaceReservationInfo(_place.id, date)
        .then((data) => reservationInfo.add(data.timeSlots));
  }
}
