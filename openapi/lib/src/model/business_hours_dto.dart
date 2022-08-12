//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:json_annotation/json_annotation.dart';

part 'business_hours_dto.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class BusinessHoursDto {
  /// Returns a new [BusinessHoursDto] instance.
  BusinessHoursDto({

     this.id,

     this.placeId,

     this.day,

     this.openTine,

     this.closeTime,
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


  int? day;



  @JsonKey(
    
    name: r'OpenTine',
    required: false,
    includeIfNull: false
  )


  String? openTine;



  @JsonKey(
    
    name: r'CloseTime',
    required: false,
    includeIfNull: false
  )


  String? closeTime;



  @override
  bool operator ==(Object other) => identical(this, other) || other is BusinessHoursDto &&
     other.id == id &&
     other.placeId == placeId &&
     other.day == day &&
     other.openTine == openTine &&
     other.closeTime == closeTime;

  @override
  int get hashCode =>
    id.hashCode +
    placeId.hashCode +
    day.hashCode +
    openTine.hashCode +
    closeTime.hashCode;

  factory BusinessHoursDto.fromJson(Map<String, dynamic> json) => _$BusinessHoursDtoFromJson(json);

  Map<String, dynamic> toJson() => _$BusinessHoursDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

