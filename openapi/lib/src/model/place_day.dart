//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:openapi/src/model/place_event.dart';
import 'package:json_annotation/json_annotation.dart';

part 'place_day.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class PlaceDay {
  /// Returns a new [PlaceDay] instance.
  PlaceDay({

     this.id,

     this.placeId,

     this.day,

     this.openHour,

     this.closeHour,

     this.placeEvents,
  });

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
    
    name: r'Day',
    required: false,
    includeIfNull: false
  )


  DateTime? day;



  @JsonKey(
    
    name: r'OpenHour',
    required: false,
    includeIfNull: false
  )


  String? openHour;



  @JsonKey(
    
    name: r'CloseHour',
    required: false,
    includeIfNull: false
  )


  String? closeHour;



  @JsonKey(
    
    name: r'PlaceEvents',
    required: false,
    includeIfNull: false
  )


  List<PlaceEvent>? placeEvents;



  @override
  bool operator ==(Object other) => identical(this, other) || other is PlaceDay &&
     other.id == id &&
     other.placeId == placeId &&
     other.day == day &&
     other.openHour == openHour &&
     other.closeHour == closeHour &&
     other.placeEvents == placeEvents;

  @override
  int get hashCode =>
    id.hashCode +
    placeId.hashCode +
    day.hashCode +
    openHour.hashCode +
    closeHour.hashCode +
    placeEvents.hashCode;

  factory PlaceDay.fromJson(Map<String, dynamic> json) => _$PlaceDayFromJson(json);

  Map<String, dynamic> toJson() => _$PlaceDayToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

