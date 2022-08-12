import 'dart:io';

import 'package:app/Helpers/type_helper.dart';
import 'package:app/app/app.dart';
import 'package:openapi/openapi.dart';
import 'package:rxdart/rxdart.dart';

class PlaceBloc {
  bool _initLoad = false;
  PlaceSimpleDto? _place;
  static const pageSize = 10;

  BehaviorSubject<PlaceSimpleDto?> place = new BehaviorSubject();

  BehaviorSubject<PlaceDto?> placeInfo = new BehaviorSubject();

  BehaviorSubject<List<PlacesPlaceReviewDto>?> reviews = new BehaviorSubject();

  BehaviorSubject<List<ReservationsTimeSlot>?> reservationInfo = new BehaviorSubject();

  int lastPage = 0;
  BehaviorSubject<bool> haveMoreReviews = new BehaviorSubject.seeded(true);

  Future<PlaceSimpleDto?> loadPlace({int? placeId, PlaceSimpleDto? place}) async {
    _place = place;
    var _placeId = place?.id ?? placeId;
    if (this.place.value == null || place!.id != this.place.value!.id) {
      placeInfo.add(null);
      this.place.add(place);
    }
    var data = await App.http!.getPlaceInfo(_placeId);
    placeInfo.add(data);
    if (_place == null) {
      _place = toSimpePlace(data);
      return _place;
    }
    reviews.add(data.placeReviews);
    return _place;
  }

  Future loadReview({force = false}) async {
    if (!haveMoreReviews.value && !force) return;

    await App.http!.getPlaceReview(_place!.id, page: lastPage + 1, pageSize: pageSize).then((data) {
      if (data.length < pageSize) {
        haveMoreReviews.add(false);
        var oldData = reviews.value!;
        oldData.addAll(data);
        reviews.add(oldData);
      }
    });
  }

  Future addReview(int? placeId, PlacesPlaceReviewDto review, {List<File>? media}) async {
    var newReview = await App.http!.addPlaceReview(placeId, review);
    var mediaDto = <MediaDto>[];
    if (media != null && media.length > 0) {
      media.forEach((f) async {
        try {
          mediaDto.add(await App.http!.uploadPlaceReviewFile(newReview.id, f));
        } catch (_) {}
      });
    }
    // TODO newReview.medias = mediaDto;
    var oldData = reviews.value!;
    oldData.insert(0, newReview);
    reviews.add(oldData);
  }

  Future loadReservationInfo(DateTime date) async {
    await App.http!.getPlaceReservationInfo(_place!.id, date).then((data) => reservationInfo.add(data.timeSlots));
  }
}
