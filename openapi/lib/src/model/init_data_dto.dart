//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:openapi/src/model/smoke_session_simple_dto.dart';
import 'package:openapi/src/model/device_setting_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'init_data_dto.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class InitDataDto {
  /// Returns a new [InitDataDto] instance.
  InitDataDto({

     this.smokeSession,

     this.deviceSettings,
  });

  @JsonKey(
    
    name: r'SmokeSession',
    required: false,
    includeIfNull: false
  )


  SmokeSessionSimpleDto? smokeSession;



  @JsonKey(
    
    name: r'DeviceSettings',
    required: false,
    includeIfNull: false
  )


  DeviceSettingDto? deviceSettings;



  @override
  bool operator ==(Object other) => identical(this, other) || other is InitDataDto &&
     other.smokeSession == smokeSession &&
     other.deviceSettings == deviceSettings;

  @override
  int get hashCode =>
    smokeSession.hashCode +
    deviceSettings.hashCode;

  factory InitDataDto.fromJson(Map<String, dynamic> json) => _$InitDataDtoFromJson(json);

  Map<String, dynamic> toJson() => _$InitDataDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

