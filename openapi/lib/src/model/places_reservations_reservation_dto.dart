//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:json_annotation/json_annotation.dart';

part 'places_reservations_reservation_dto.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class PlacesReservationsReservationDto {
  /// Returns a new [PlacesReservationsReservationDto] instance.
  PlacesReservationsReservationDto({

     this.id,

     this.created,

     this.personId,

     this.placeId,

     this.placeName,

     this.started,

     this.end,

     this.persons,

     this.duration,

     this.time,

     this.text,

     this.name,

     this.displayName,

     this.status,

     this.seats,

     this.lateDuration,
  });

  @JsonKey(
    
    name: r'Id',
    required: false,
    includeIfNull: false
  )


  int? id;



  @JsonKey(
    
    name: r'Created',
    required: false,
    includeIfNull: false
  )


  DateTime? created;



  @JsonKey(
    
    name: r'PersonId',
    required: false,
    includeIfNull: false
  )


  int? personId;



  @JsonKey(
    
    name: r'PlaceId',
    required: false,
    includeIfNull: false
  )


  int? placeId;



  @JsonKey(
    
    name: r'PlaceName',
    required: false,
    includeIfNull: false
  )


  String? placeName;



  @JsonKey(
    
    name: r'Started',
    required: false,
    includeIfNull: false
  )


  DateTime? started;



  @JsonKey(
    
    name: r'End',
    required: false,
    includeIfNull: false
  )


  DateTime? end;



  @JsonKey(
    
    name: r'Persons',
    required: false,
    includeIfNull: false
  )


  int? persons;



  @JsonKey(
    
    name: r'Duration',
    required: false,
    includeIfNull: false
  )


  String? duration;



  @JsonKey(
    
    name: r'Time',
    required: false,
    includeIfNull: false
  )


  DateTime? time;



  @JsonKey(
    
    name: r'Text',
    required: false,
    includeIfNull: false
  )


  String? text;



  @JsonKey(
    
    name: r'Name',
    required: false,
    includeIfNull: false
  )


  String? name;



  @JsonKey(
    
    name: r'DisplayName',
    required: false,
    includeIfNull: false
  )


  String? displayName;



  @JsonKey(
    
    name: r'Status',
    required: false,
    includeIfNull: false
  )


  int? status;



  @JsonKey(
    
    name: r'Seats',
    required: false,
    includeIfNull: false
  )


  List<int>? seats;



  @JsonKey(
    
    name: r'LateDuration',
    required: false,
    includeIfNull: false
  )


  int? lateDuration;



  @override
  bool operator ==(Object other) => identical(this, other) || other is PlacesReservationsReservationDto &&
     other.id == id &&
     other.created == created &&
     other.personId == personId &&
     other.placeId == placeId &&
     other.placeName == placeName &&
     other.started == started &&
     other.end == end &&
     other.persons == persons &&
     other.duration == duration &&
     other.time == time &&
     other.text == text &&
     other.name == name &&
     other.displayName == displayName &&
     other.status == status &&
     other.seats == seats &&
     other.lateDuration == lateDuration;

  @override
  int get hashCode =>
    id.hashCode +
    created.hashCode +
    personId.hashCode +
    placeId.hashCode +
    placeName.hashCode +
    started.hashCode +
    end.hashCode +
    persons.hashCode +
    duration.hashCode +
    time.hashCode +
    text.hashCode +
    name.hashCode +
    displayName.hashCode +
    status.hashCode +
    seats.hashCode +
    lateDuration.hashCode;

  factory PlacesReservationsReservationDto.fromJson(Map<String, dynamic> json) => _$PlacesReservationsReservationDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PlacesReservationsReservationDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

