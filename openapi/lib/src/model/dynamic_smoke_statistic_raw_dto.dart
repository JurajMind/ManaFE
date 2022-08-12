//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:json_annotation/json_annotation.dart';

part 'dynamic_smoke_statistic_raw_dto.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class DynamicSmokeStatisticRawDto {
  /// Returns a new [DynamicSmokeStatisticRawDto] instance.
  DynamicSmokeStatisticRawDto({

     this.pufCount,

     this.lastPuf,

     this.lastPufTime,

     this.smokeDuration,

     this.longestPuf,

     this.start,

     this.duration,

     this.longestPufMilis,
  });

  @JsonKey(
    
    name: r'PufCount',
    required: false,
    includeIfNull: false
  )


  int? pufCount;



  @JsonKey(
    
    name: r'LastPuf',
    required: false,
    includeIfNull: false
  )


  int? lastPuf;



  @JsonKey(
    
    name: r'LastPufTime',
    required: false,
    includeIfNull: false
  )


  int? lastPufTime;



  @JsonKey(
    
    name: r'SmokeDuration',
    required: false,
    includeIfNull: false
  )


  int? smokeDuration;



  @JsonKey(
    
    name: r'LongestPuf',
    required: false,
    includeIfNull: false
  )


  int? longestPuf;



  @JsonKey(
    
    name: r'Start',
    required: false,
    includeIfNull: false
  )


  int? start;



  @JsonKey(
    
    name: r'Duration',
    required: false,
    includeIfNull: false
  )


  int? duration;



  @JsonKey(
    
    name: r'LongestPufMilis',
    required: false,
    includeIfNull: false
  )


  int? longestPufMilis;



  @override
  bool operator ==(Object other) => identical(this, other) || other is DynamicSmokeStatisticRawDto &&
     other.pufCount == pufCount &&
     other.lastPuf == lastPuf &&
     other.lastPufTime == lastPufTime &&
     other.smokeDuration == smokeDuration &&
     other.longestPuf == longestPuf &&
     other.start == start &&
     other.duration == duration &&
     other.longestPufMilis == longestPufMilis;

  @override
  int get hashCode =>
    pufCount.hashCode +
    lastPuf.hashCode +
    lastPufTime.hashCode +
    smokeDuration.hashCode +
    longestPuf.hashCode +
    start.hashCode +
    duration.hashCode +
    longestPufMilis.hashCode;

  factory DynamicSmokeStatisticRawDto.fromJson(Map<String, dynamic> json) => _$DynamicSmokeStatisticRawDtoFromJson(json);

  Map<String, dynamic> toJson() => _$DynamicSmokeStatisticRawDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

