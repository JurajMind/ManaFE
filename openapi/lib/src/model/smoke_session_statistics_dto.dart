//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:json_annotation/json_annotation.dart';

part 'smoke_session_statistics_dto.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class SmokeSessionStatisticsDto {
  /// Returns a new [SmokeSessionStatisticsDto] instance.
  SmokeSessionStatisticsDto({

     this.id,

     this.start,

     this.end,

     this.smokeDuration,

     this.longestPuf,

     this.pufCount,

     this.estimatedPersonCount,

     this.sessionDuration,
  });

  @JsonKey(
    
    name: r'id',
    required: false,
    includeIfNull: false
  )


  int? id;



  @JsonKey(
    
    name: r'start',
    required: false,
    includeIfNull: false
  )


  DateTime? start;



  @JsonKey(
    
    name: r'end',
    required: false,
    includeIfNull: false
  )


  DateTime? end;



  @JsonKey(
    
    name: r'smokeDuration',
    required: false,
    includeIfNull: false
  )


  String? smokeDuration;



  @JsonKey(
    
    name: r'longestPuf',
    required: false,
    includeIfNull: false
  )


  String? longestPuf;



  @JsonKey(
    
    name: r'pufCount',
    required: false,
    includeIfNull: false
  )


  int? pufCount;



  @JsonKey(
    
    name: r'estimatedPersonCount',
    required: false,
    includeIfNull: false
  )


  int? estimatedPersonCount;



  @JsonKey(
    
    name: r'sessionDuration',
    required: false,
    includeIfNull: false
  )


  String? sessionDuration;



  @override
  bool operator ==(Object other) => identical(this, other) || other is SmokeSessionStatisticsDto &&
     other.id == id &&
     other.start == start &&
     other.end == end &&
     other.smokeDuration == smokeDuration &&
     other.longestPuf == longestPuf &&
     other.pufCount == pufCount &&
     other.estimatedPersonCount == estimatedPersonCount &&
     other.sessionDuration == sessionDuration;

  @override
  int get hashCode =>
    id.hashCode +
    start.hashCode +
    end.hashCode +
    smokeDuration.hashCode +
    longestPuf.hashCode +
    pufCount.hashCode +
    estimatedPersonCount.hashCode +
    sessionDuration.hashCode;

  factory SmokeSessionStatisticsDto.fromJson(Map<String, dynamic> json) => _$SmokeSessionStatisticsDtoFromJson(json);

  Map<String, dynamic> toJson() => _$SmokeSessionStatisticsDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

