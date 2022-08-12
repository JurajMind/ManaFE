//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:openapi/src/model/smoke_session_simple_dto.dart';
import 'package:openapi/src/model/smoke_session_statistics_dto.dart';
import 'package:openapi/src/model/smoke_session_meta_data_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'finished_session_data_dto.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class FinishedSessionDataDto {
  /// Returns a new [FinishedSessionDataDto] instance.
  FinishedSessionDataDto({

     this.data,

     this.metaData,

     this.statistics,

     this.assigned,
  });

  @JsonKey(
    
    name: r'Data',
    required: false,
    includeIfNull: false
  )


  SmokeSessionSimpleDto? data;



  @JsonKey(
    
    name: r'MetaData',
    required: false,
    includeIfNull: false
  )


  SmokeSessionMetaDataDto? metaData;



  @JsonKey(
    
    name: r'Statistics',
    required: false,
    includeIfNull: false
  )


  SmokeSessionStatisticsDto? statistics;



  @JsonKey(
    
    name: r'Assigned',
    required: false,
    includeIfNull: false
  )


  bool? assigned;



  @override
  bool operator ==(Object other) => identical(this, other) || other is FinishedSessionDataDto &&
     other.data == data &&
     other.metaData == metaData &&
     other.statistics == statistics &&
     other.assigned == assigned;

  @override
  int get hashCode =>
    data.hashCode +
    metaData.hashCode +
    statistics.hashCode +
    assigned.hashCode;

  factory FinishedSessionDataDto.fromJson(Map<String, dynamic> json) => _$FinishedSessionDataDtoFromJson(json);

  Map<String, dynamic> toJson() => _$FinishedSessionDataDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

