//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:openapi/src/model/place_dto.dart';
import 'package:openapi/src/model/smoke_session_simple_dto.dart';
import 'package:openapi/src/model/places_reservations_reservation_dto.dart';
import 'package:openapi/src/model/hookah_order_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'places_reservations_reservation_detail_dto.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class PlacesReservationsReservationDetailDto {
  /// Returns a new [PlacesReservationsReservationDetailDto] instance.
  PlacesReservationsReservationDetailDto({

     this.reservation,

     this.place,

     this.smokeSessions,

     this.orders,
  });

  @JsonKey(
    
    name: r'Reservation',
    required: false,
    includeIfNull: false
  )


  PlacesReservationsReservationDto? reservation;



  @JsonKey(
    
    name: r'Place',
    required: false,
    includeIfNull: false
  )


  PlaceDto? place;



  @JsonKey(
    
    name: r'SmokeSessions',
    required: false,
    includeIfNull: false
  )


  List<SmokeSessionSimpleDto>? smokeSessions;



  @JsonKey(
    
    name: r'Orders',
    required: false,
    includeIfNull: false
  )


  List<HookahOrderDto>? orders;



  @override
  bool operator ==(Object other) => identical(this, other) || other is PlacesReservationsReservationDetailDto &&
     other.reservation == reservation &&
     other.place == place &&
     other.smokeSessions == smokeSessions &&
     other.orders == orders;

  @override
  int get hashCode =>
    reservation.hashCode +
    place.hashCode +
    smokeSessions.hashCode +
    orders.hashCode;

  factory PlacesReservationsReservationDetailDto.fromJson(Map<String, dynamic> json) => _$PlacesReservationsReservationDetailDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PlacesReservationsReservationDetailDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

