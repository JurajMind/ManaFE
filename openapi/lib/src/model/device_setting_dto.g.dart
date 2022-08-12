// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_setting_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeviceSettingDto _$DeviceSettingDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'DeviceSettingDto',
      json,
      ($checkedConvert) {
        final val = DeviceSettingDto(
          puffSettings: $checkedConvert(
              'PuffSettings',
              (v) => v == null
                  ? null
                  : ActionSettings.fromJson(v as Map<String, dynamic>)),
          blowSettings: $checkedConvert(
              'BlowSettings',
              (v) => v == null
                  ? null
                  : ActionSettings.fromJson(v as Map<String, dynamic>)),
          idleSettings: $checkedConvert(
              'IdleSettings',
              (v) => v == null
                  ? null
                  : ActionSettings.fromJson(v as Map<String, dynamic>)),
        );
        return val;
      },
      fieldKeyMap: const {
        'puffSettings': 'PuffSettings',
        'blowSettings': 'BlowSettings',
        'idleSettings': 'IdleSettings'
      },
    );

Map<String, dynamic> _$DeviceSettingDtoToJson(DeviceSettingDto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('PuffSettings', instance.puffSettings?.toJson());
  writeNotNull('BlowSettings', instance.blowSettings?.toJson());
  writeNotNull('IdleSettings', instance.idleSettings?.toJson());
  return val;
}
