//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:openapi/src/model/device_simple_dto.dart';
import 'package:openapi/src/model/smoke_session_meta_data_dto.dart';
import 'package:openapi/src/model/dynamic_smoke_statistic_raw_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'places_device_place_dashboard_dto.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class PlacesDevicePlaceDashboardDto {
  /// Returns a new [PlacesDevicePlaceDashboardDto] instance.
  PlacesDevicePlaceDashboardDto({

     this.device,

     this.statistic,

     this.metaData,

     this.tobaccoEstimate,
  });

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
    
    name: r'TobaccoEstimate',
    required: false,
    includeIfNull: false
  )


  double? tobaccoEstimate;



  @override
  bool operator ==(Object other) => identical(this, other) || other is PlacesDevicePlaceDashboardDto &&
     other.device == device &&
     other.statistic == statistic &&
     other.metaData == metaData &&
     other.tobaccoEstimate == tobaccoEstimate;

  @override
  int get hashCode =>
    device.hashCode +
    statistic.hashCode +
    metaData.hashCode +
    tobaccoEstimate.hashCode;

  factory PlacesDevicePlaceDashboardDto.fromJson(Map<String, dynamic> json) => _$PlacesDevicePlaceDashboardDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PlacesDevicePlaceDashboardDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

