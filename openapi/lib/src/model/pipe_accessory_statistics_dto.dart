//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:json_annotation/json_annotation.dart';

part 'pipe_accessory_statistics_dto.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class PipeAccessoryStatisticsDto {
  /// Returns a new [PipeAccessoryStatisticsDto] instance.
  PipeAccessoryStatisticsDto({

     this.used,

     this.weight,

     this.pipeAccessoryId,

     this.smokeDurationTicks,

     this.pufCount,

     this.blowCount,

     this.sessionDurationTick,

     this.packType,

     this.cut,

     this.strength,

     this.duration,

     this.taste,

     this.smoke,

     this.overall,

     this.smokeTimePercentil,

     this.sessionTimePercentil,
  });

  @JsonKey(
    
    name: r'Used',
    required: false,
    includeIfNull: false
  )


  int? used;



  @JsonKey(
    
    name: r'Weight',
    required: false,
    includeIfNull: false
  )


  double? weight;



  @JsonKey(
    
    name: r'PipeAccessoryId',
    required: false,
    includeIfNull: false
  )


  int? pipeAccessoryId;



  @JsonKey(
    
    name: r'SmokeDurationTicks',
    required: false,
    includeIfNull: false
  )


  int? smokeDurationTicks;



  @JsonKey(
    
    name: r'PufCount',
    required: false,
    includeIfNull: false
  )


  double? pufCount;



  @JsonKey(
    
    name: r'BlowCount',
    required: false,
    includeIfNull: false
  )


  double? blowCount;



  @JsonKey(
    
    name: r'SessionDurationTick',
    required: false,
    includeIfNull: false
  )


  int? sessionDurationTick;



  @JsonKey(
    
    name: r'PackType',
    required: false,
    includeIfNull: false
  )


  PipeAccessoryStatisticsDtoPackTypeEnum? packType;



  @JsonKey(
    
    name: r'Cut',
    required: false,
    includeIfNull: false
  )


  double? cut;



  @JsonKey(
    
    name: r'Strength',
    required: false,
    includeIfNull: false
  )


  double? strength;



  @JsonKey(
    
    name: r'Duration',
    required: false,
    includeIfNull: false
  )


  double? duration;



  @JsonKey(
    
    name: r'Taste',
    required: false,
    includeIfNull: false
  )


  double? taste;



  @JsonKey(
    
    name: r'Smoke',
    required: false,
    includeIfNull: false
  )


  double? smoke;



  @JsonKey(
    
    name: r'Overall',
    required: false,
    includeIfNull: false
  )


  double? overall;



  @JsonKey(
    
    name: r'SmokeTimePercentil',
    required: false,
    includeIfNull: false
  )


  double? smokeTimePercentil;



  @JsonKey(
    
    name: r'SessionTimePercentil',
    required: false,
    includeIfNull: false
  )


  double? sessionTimePercentil;



  @override
  bool operator ==(Object other) => identical(this, other) || other is PipeAccessoryStatisticsDto &&
     other.used == used &&
     other.weight == weight &&
     other.pipeAccessoryId == pipeAccessoryId &&
     other.smokeDurationTicks == smokeDurationTicks &&
     other.pufCount == pufCount &&
     other.blowCount == blowCount &&
     other.sessionDurationTick == sessionDurationTick &&
     other.packType == packType &&
     other.cut == cut &&
     other.strength == strength &&
     other.duration == duration &&
     other.taste == taste &&
     other.smoke == smoke &&
     other.overall == overall &&
     other.smokeTimePercentil == smokeTimePercentil &&
     other.sessionTimePercentil == sessionTimePercentil;

  @override
  int get hashCode =>
    used.hashCode +
    weight.hashCode +
    pipeAccessoryId.hashCode +
    smokeDurationTicks.hashCode +
    pufCount.hashCode +
    blowCount.hashCode +
    sessionDurationTick.hashCode +
    packType.hashCode +
    cut.hashCode +
    strength.hashCode +
    duration.hashCode +
    taste.hashCode +
    smoke.hashCode +
    overall.hashCode +
    smokeTimePercentil.hashCode +
    sessionTimePercentil.hashCode;

  factory PipeAccessoryStatisticsDto.fromJson(Map<String, dynamic> json) => _$PipeAccessoryStatisticsDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PipeAccessoryStatisticsDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}


enum PipeAccessoryStatisticsDtoPackTypeEnum {
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


