//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:json_annotation/json_annotation.dart';

part 'smoke_session_time_statistics_dto.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class SmokeSessionTimeStatisticsDto {
  /// Returns a new [SmokeSessionTimeStatisticsDto] instance.
  SmokeSessionTimeStatisticsDto({

     this.sessionsCount,

     this.sessionsDuration,

     this.smokeDuration,

     this.puffCount,

     this.dayOfWeekDistribution,

     this.sessionStartTimeDistribution,
  });

  @JsonKey(
    
    name: r'SessionsCount',
    required: false,
    includeIfNull: false
  )


  int? sessionsCount;



  @JsonKey(
    
    name: r'SessionsDuration',
    required: false,
    includeIfNull: false
  )


  String? sessionsDuration;



  @JsonKey(
    
    name: r'SmokeDuration',
    required: false,
    includeIfNull: false
  )


  String? smokeDuration;



  @JsonKey(
    
    name: r'PuffCount',
    required: false,
    includeIfNull: false
  )


  int? puffCount;



  @JsonKey(
    
    name: r'DayOfWeekDistribution',
    required: false,
    includeIfNull: false
  )


  Map<String, int>? dayOfWeekDistribution;



  @JsonKey(
    
    name: r'SessionStartTimeDistribution',
    required: false,
    includeIfNull: false
  )


  Map<String, int>? sessionStartTimeDistribution;



  @override
  bool operator ==(Object other) => identical(this, other) || other is SmokeSessionTimeStatisticsDto &&
     other.sessionsCount == sessionsCount &&
     other.sessionsDuration == sessionsDuration &&
     other.smokeDuration == smokeDuration &&
     other.puffCount == puffCount &&
     other.dayOfWeekDistribution == dayOfWeekDistribution &&
     other.sessionStartTimeDistribution == sessionStartTimeDistribution;

  @override
  int get hashCode =>
    sessionsCount.hashCode +
    sessionsDuration.hashCode +
    smokeDuration.hashCode +
    puffCount.hashCode +
    dayOfWeekDistribution.hashCode +
    sessionStartTimeDistribution.hashCode;

  factory SmokeSessionTimeStatisticsDto.fromJson(Map<String, dynamic> json) => _$SmokeSessionTimeStatisticsDtoFromJson(json);

  Map<String, dynamic> toJson() => _$SmokeSessionTimeStatisticsDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

