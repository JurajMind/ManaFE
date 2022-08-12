//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:openapi/src/model/seat_dto.dart';
import 'package:openapi/src/model/smoke_session_simple_dto.dart';
import 'package:openapi/src/model/places_reservations_reservation_dto.dart';
import 'package:openapi/src/model/smoke_session_meta_data_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'hookah_order_dto.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class HookahOrderDto {
  /// Returns a new [HookahOrderDto] instance.
  HookahOrderDto({

     this.created,

     this.id,

     this.placeId,

     this.personId,

     this.smokeSessionMetaDataId,

     this.smokeSessionMetaData,

     this.smokeSessionId,

     this.smokeSession,

     this.extraInfo,

     this.state,

     this.price,

     this.currency,

     this.seatId,

     this.seat,

     this.reservationId,

     this.reservation,

     this.type,
  });

  @JsonKey(
    
    name: r'Created',
    required: false,
    includeIfNull: false
  )


  DateTime? created;



  @JsonKey(
    
    name: r'Id',
    required: false,
    includeIfNull: false
  )


  int? id;



  @JsonKey(
    
    name: r'PlaceId',
    required: false,
    includeIfNull: false
  )


  int? placeId;



  @JsonKey(
    
    name: r'PersonId',
    required: false,
    includeIfNull: false
  )


  int? personId;



  @JsonKey(
    
    name: r'SmokeSessionMetaDataId',
    required: false,
    includeIfNull: false
  )


  int? smokeSessionMetaDataId;



  @JsonKey(
    
    name: r'SmokeSessionMetaData',
    required: false,
    includeIfNull: false
  )


  SmokeSessionMetaDataDto? smokeSessionMetaData;



  @JsonKey(
    
    name: r'SmokeSessionId',
    required: false,
    includeIfNull: false
  )


  int? smokeSessionId;



  @JsonKey(
    
    name: r'SmokeSession',
    required: false,
    includeIfNull: false
  )


  SmokeSessionSimpleDto? smokeSession;



  @JsonKey(
    
    name: r'ExtraInfo',
    required: false,
    includeIfNull: false
  )


  String? extraInfo;



  @JsonKey(
    
    name: r'State',
    required: false,
    includeIfNull: false
  )


  HookahOrderDtoStateEnum? state;



  @JsonKey(
    
    name: r'Price',
    required: false,
    includeIfNull: false
  )


  double? price;



  @JsonKey(
    
    name: r'Currency',
    required: false,
    includeIfNull: false
  )


  String? currency;



  @JsonKey(
    
    name: r'SeatId',
    required: false,
    includeIfNull: false
  )


  int? seatId;



  @JsonKey(
    
    name: r'Seat',
    required: false,
    includeIfNull: false
  )


  SeatDto? seat;



  @JsonKey(
    
    name: r'ReservationId',
    required: false,
    includeIfNull: false
  )


  int? reservationId;



  @JsonKey(
    
    name: r'Reservation',
    required: false,
    includeIfNull: false
  )


  PlacesReservationsReservationDto? reservation;



  @JsonKey(
    
    name: r'Type',
    required: false,
    includeIfNull: false
  )


  HookahOrderDtoTypeEnum? type;



  @override
  bool operator ==(Object other) => identical(this, other) || other is HookahOrderDto &&
     other.created == created &&
     other.id == id &&
     other.placeId == placeId &&
     other.personId == personId &&
     other.smokeSessionMetaDataId == smokeSessionMetaDataId &&
     other.smokeSessionMetaData == smokeSessionMetaData &&
     other.smokeSessionId == smokeSessionId &&
     other.smokeSession == smokeSession &&
     other.extraInfo == extraInfo &&
     other.state == state &&
     other.price == price &&
     other.currency == currency &&
     other.seatId == seatId &&
     other.seat == seat &&
     other.reservationId == reservationId &&
     other.reservation == reservation &&
     other.type == type;

  @override
  int get hashCode =>
    created.hashCode +
    id.hashCode +
    placeId.hashCode +
    personId.hashCode +
    smokeSessionMetaDataId.hashCode +
    smokeSessionMetaData.hashCode +
    smokeSessionId.hashCode +
    smokeSession.hashCode +
    extraInfo.hashCode +
    state.hashCode +
    price.hashCode +
    currency.hashCode +
    seatId.hashCode +
    seat.hashCode +
    reservationId.hashCode +
    reservation.hashCode +
    type.hashCode;

  factory HookahOrderDto.fromJson(Map<String, dynamic> json) => _$HookahOrderDtoFromJson(json);

  Map<String, dynamic> toJson() => _$HookahOrderDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}


enum HookahOrderDtoStateEnum {
  @JsonValue(0)
  number0,
  @JsonValue(1)
  number1,
  @JsonValue(2)
  number2,
  @JsonValue(3)
  number3,
  @JsonValue(4)
  number4,
}



enum HookahOrderDtoTypeEnum {
  @JsonValue(0)
  number0,
  @JsonValue(1)
  number1,
  @JsonValue(2)
  number2,
}


