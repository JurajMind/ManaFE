//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:openapi/src/model/action_settings.dart';
import 'package:json_annotation/json_annotation.dart';

part 'device_setting_dto.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class DeviceSettingDto {
  /// Returns a new [DeviceSettingDto] instance.
  DeviceSettingDto({

     this.puffSettings,

     this.blowSettings,

     this.idleSettings,
  });

  @JsonKey(
    
    name: r'PuffSettings',
    required: false,
    includeIfNull: false
  )


  ActionSettings? puffSettings;



  @JsonKey(
    
    name: r'BlowSettings',
    required: false,
    includeIfNull: false
  )


  ActionSettings? blowSettings;



  @JsonKey(
    
    name: r'IdleSettings',
    required: false,
    includeIfNull: false
  )


  ActionSettings? idleSettings;



  @override
  bool operator ==(Object other) => identical(this, other) || other is DeviceSettingDto &&
     other.puffSettings == puffSettings &&
     other.blowSettings == blowSettings &&
     other.idleSettings == idleSettings;

  @override
  int get hashCode =>
    puffSettings.hashCode +
    blowSettings.hashCode +
    idleSettings.hashCode;

  factory DeviceSettingDto.fromJson(Map<String, dynamic> json) => _$DeviceSettingDtoFromJson(json);

  Map<String, dynamic> toJson() => _$DeviceSettingDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

