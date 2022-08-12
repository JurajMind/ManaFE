//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:openapi/src/model/device_simple_dto.dart';
import 'package:openapi/src/model/smoke_session_meta_data_dto.dart';
import 'package:openapi/src/model/dynamic_smoke_statistic_raw_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'smoke_session_simple_dto.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class SmokeSessionSimpleDto {
  /// Returns a new [SmokeSessionSimpleDto] instance.
  SmokeSessionSimpleDto({

     this.id,

     this.live,

     this.sessionId,

     this.device,

     this.statistic,

     this.metaData,

     this.placeId,

     this.placeName,
  });

  @JsonKey(
    
    name: r'Id',
    required: false,
    includeIfNull: false
  )


  int? id;



  @JsonKey(
    
    name: r'Live',
    required: false,
    includeIfNull: false
  )


  bool? live;



  @JsonKey(
    
    name: r'SessionId',
    required: false,
    includeIfNull: false
  )


  String? sessionId;



  @JsonKey(
    
    name: r'Device',
    required: false,
    includeIfNull: false
  )


  DeviceSimpleDto? device;



  @JsonKey(
    
    name: r'Statistic',
    required: false,
    includeIfNull: false
  )


  DynamicSmokeStatisticRawDto? statistic;



  @JsonKey(
    
    name: r'MetaData',
    required: false,
    includeIfNull: false
  )


  SmokeSessionMetaDataDto? metaData;



  @JsonKey(
    
    name: r'PlaceId',
    required: false,
    includeIfNull: false
  )


  int? placeId;



  @JsonKey(
    
    name: r'PlaceName',
    required: false,
    includeIfNull: false
  )


  String? placeName;



  @override
  bool operator ==(Object other) => identical(this, other) || other is SmokeSessionSimpleDto &&
     other.id == id &&
     other.live == live &&
     other.sessionId == sessionId &&
     other.device == device &&
     other.statistic == statistic &&
     other.metaData == metaData &&
     other.placeId == placeId &&
     other.placeName == placeName;

  @override
  int get hashCode =>
    id.hashCode +
    live.hashCode +
    sessionId.hashCode +
    device.hashCode +
    statistic.hashCode +
    metaData.hashCode +
    placeId.hashCode +
    placeName.hashCode;

  factory SmokeSessionSimpleDto.fromJson(Map<String, dynamic> json) => _$SmokeSessionSimpleDtoFromJson(json);

  Map<String, dynamic> toJson() => _$SmokeSessionSimpleDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

