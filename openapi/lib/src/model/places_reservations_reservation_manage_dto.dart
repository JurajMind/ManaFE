//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:openapi/src/model/seat_dto.dart';
import 'package:openapi/src/model/places_reservations_reservation_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'places_reservations_reservation_manage_dto.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class PlacesReservationsReservationManageDto {
  /// Returns a new [PlacesReservationsReservationManageDto] instance.
  PlacesReservationsReservationManageDto({

     this.startTime,

     this.endTime,

     this.timeSlotSize,

     this.date,

     this.tables,

     this.reservations,
  });

  @JsonKey(
    
    name: r'startTime',
    required: false,
    includeIfNull: false
  )


  DateTime? startTime;



  @JsonKey(
    
    name: r'endTime',
    required: false,
    includeIfNull: false
  )


  DateTime? endTime;



  @JsonKey(
    
    name: r'TimeSlotSize',
    required: false,
    includeIfNull: false
  )


  int? timeSlotSize;



  @JsonKey(
    
    name: r'Date',
    required: false,
    includeIfNull: false
  )


  DateTime? date;



  @JsonKey(
    
    name: r'Tables',
    required: false,
    includeIfNull: false
  )


  List<SeatDto>? tables;



  @JsonKey(
    
    name: r'Reservations',
    required: false,
    includeIfNull: false
  )


  List<PlacesReservationsReservationDto>? reservations;



  @override
  bool operator ==(Object other) => identical(this, other) || other is PlacesReservationsReservationManageDto &&
     other.startTime == startTime &&
     other.endTime == endTime &&
     other.timeSlotSize == timeSlotSize &&
     other.date == date &&
     other.tables == tables &&
     other.reservations == reservations;

  @override
  int get hashCode =>
    startTime.hashCode +
    endTime.hashCode +
    timeSlotSize.hashCode +
    date.hashCode +
    tables.hashCode +
    reservations.hashCode;

  factory PlacesReservationsReservationManageDto.fromJson(Map<String, dynamic> json) => _$PlacesReservationsReservationManageDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PlacesReservationsReservationManageDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

