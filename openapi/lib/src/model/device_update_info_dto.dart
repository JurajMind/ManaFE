//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:openapi/src/model/device_update_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'device_update_info_dto.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class DeviceUpdateInfoDto {
  /// Returns a new [DeviceUpdateInfoDto] instance.
  DeviceUpdateInfoDto({

     this.stableVersion,

     this.betaVersion,
  });

  @JsonKey(
    
    name: r'StableVersion',
    required: false,
    includeIfNull: false
  )


  DeviceUpdateDto? stableVersion;



  @JsonKey(
    
    name: r'BetaVersion',
    required: false,
    includeIfNull: false
  )


  DeviceUpdateDto? betaVersion;



  @override
  bool operator ==(Object other) => identical(this, other) || other is DeviceUpdateInfoDto &&
     other.stableVersion == stableVersion &&
     other.betaVersion == betaVersion;

  @override
  int get hashCode =>
    stableVersion.hashCode +
    betaVersion.hashCode;

  factory DeviceUpdateInfoDto.fromJson(Map<String, dynamic> json) => _$DeviceUpdateInfoDtoFromJson(json);

  Map<String, dynamic> toJson() => _$DeviceUpdateInfoDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

