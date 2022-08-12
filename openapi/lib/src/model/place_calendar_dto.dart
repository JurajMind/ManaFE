//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:openapi/src/model/place_day.dart';
import 'package:json_annotation/json_annotation.dart';

part 'place_calendar_dto.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class PlaceCalendarDto {
  /// Returns a new [PlaceCalendarDto] instance.
  PlaceCalendarDto({

     this.placeDays,
  });

  @JsonKey(
    
    name: r'PlaceDays',
    required: false,
    includeIfNull: false
  )


  List<PlaceDay>? placeDays;



  @override
  bool operator ==(Object other) => identical(this, other) || other is PlaceCalendarDto &&
     other.placeDays == placeDays;

  @override
  int get hashCode =>
    placeDays.hashCode;

  factory PlaceCalendarDto.fromJson(Map<String, dynamic> json) => _$PlaceCalendarDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PlaceCalendarDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

