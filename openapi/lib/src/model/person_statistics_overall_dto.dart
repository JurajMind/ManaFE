//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:openapi/src/model/pipe_accessory_usage_dto.dart';
import 'package:openapi/src/model/smoke_session_simple_dto.dart';
import 'package:openapi/src/model/smoke_session_time_statistics_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'person_statistics_overall_dto.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class PersonStatisticsOverallDto {
  /// Returns a new [PersonStatisticsOverallDto] instance.
  PersonStatisticsOverallDto({

     this.timeStatistics,

     this.accessoriesUsage,

     this.smokeSessions,
  });

  @JsonKey(
    
    name: r'TimeStatistics',
    required: false,
    includeIfNull: false
  )


  SmokeSessionTimeStatisticsDto? timeStatistics;



  @JsonKey(
    
    name: r'AccessoriesUsage',
    required: false,
    includeIfNull: false
  )


  List<PipeAccessoryUsageDto>? accessoriesUsage;



  @JsonKey(
    
    name: r'SmokeSessions',
    required: false,
    includeIfNull: false
  )


  List<SmokeSessionSimpleDto>? smokeSessions;



  @override
  bool operator ==(Object other) => identical(this, other) || other is PersonStatisticsOverallDto &&
     other.timeStatistics == timeStatistics &&
     other.accessoriesUsage == accessoriesUsage &&
     other.smokeSessions == smokeSessions;

  @override
  int get hashCode =>
    timeStatistics.hashCode +
    accessoriesUsage.hashCode +
    smokeSessions.hashCode;

  factory PersonStatisticsOverallDto.fromJson(Map<String, dynamic> json) => _$PersonStatisticsOverallDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PersonStatisticsOverallDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

