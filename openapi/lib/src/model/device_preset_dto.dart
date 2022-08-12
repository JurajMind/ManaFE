//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:openapi/src/model/device_setting_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'device_preset_dto.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class DevicePresetDto {
  /// Returns a new [DevicePresetDto] instance.
  DevicePresetDto({

     this.id,

     this.name,

     this.personId,

     this.setting,
  });

  @JsonKey(
    
    name: r'id',
    required: false,
    includeIfNull: false
  )


  int? id;



  @JsonKey(
    
    name: r'name',
    required: false,
    includeIfNull: false
  )


  String? name;



  @JsonKey(
    
    name: r'personId',
    required: false,
    includeIfNull: false
  )


  int? personId;



  @JsonKey(
    
    name: r'setting',
    required: false,
    includeIfNull: false
  )


  DeviceSettingDto? setting;



  @override
  bool operator ==(Object other) => identical(this, other) || other is DevicePresetDto &&
     other.id == id &&
     other.name == name &&
     other.personId == personId &&
     other.setting == setting;

  @override
  int get hashCode =>
    id.hashCode +
    name.hashCode +
    personId.hashCode +
    setting.hashCode;

  factory DevicePresetDto.fromJson(Map<String, dynamic> json) => _$DevicePresetDtoFromJson(json);

  Map<String, dynamic> toJson() => _$DevicePresetDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

