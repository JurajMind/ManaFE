//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:json_annotation/json_annotation.dart';

part 'place_event.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class PlaceEvent {
  /// Returns a new [PlaceEvent] instance.
  PlaceEvent({

     this.id,

     this.placeDayId,

     this.title,

     this.description,

     this.start,

     this.end,

     this.privacyType,

     this.facebookUrl,

     this.success,

     this.message,

     this.httpResponseCode,
  });

  @JsonKey(
    
    name: r'Id',
    required: false,
    includeIfNull: false
  )


  int? id;



  @JsonKey(
    
    name: r'PlaceDayId',
    required: false,
    includeIfNull: false
  )


  int? placeDayId;



  @JsonKey(
    
    name: r'Title',
    required: false,
    includeIfNull: false
  )


  String? title;



  @JsonKey(
    
    name: r'Description',
    required: false,
    includeIfNull: false
  )


  String? description;



  @JsonKey(
    
    name: r'Start',
    required: false,
    includeIfNull: false
  )


  DateTime? start;



  @JsonKey(
    
    name: r'End',
    required: false,
    includeIfNull: false
  )


  DateTime? end;



  @JsonKey(
    
    name: r'PrivacyType',
    required: false,
    includeIfNull: false
  )


  String? privacyType;



  @JsonKey(
    
    name: r'FacebookUrl',
    required: false,
    includeIfNull: false
  )


  String? facebookUrl;



  @JsonKey(
    
    name: r'Success',
    required: false,
    includeIfNull: false
  )


  bool? success;



  @JsonKey(
    
    name: r'Message',
    required: false,
    includeIfNull: false
  )


  String? message;



  @JsonKey(
    
    name: r'HttpResponseCode',
    required: false,
    includeIfNull: false
  )


  int? httpResponseCode;



  @override
  bool operator ==(Object other) => identical(this, other) || other is PlaceEvent &&
     other.id == id &&
     other.placeDayId == placeDayId &&
     other.title == title &&
     other.description == description &&
     other.start == start &&
     other.end == end &&
     other.privacyType == privacyType &&
     other.facebookUrl == facebookUrl &&
     other.success == success &&
     other.message == message &&
     other.httpResponseCode == httpResponseCode;

  @override
  int get hashCode =>
    id.hashCode +
    placeDayId.hashCode +
    title.hashCode +
    description.hashCode +
    start.hashCode +
    end.hashCode +
    privacyType.hashCode +
    facebookUrl.hashCode +
    success.hashCode +
    message.hashCode +
    httpResponseCode.hashCode;

  factory PlaceEvent.fromJson(Map<String, dynamic> json) => _$PlaceEventFromJson(json);

  Map<String, dynamic> toJson() => _$PlaceEventToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

