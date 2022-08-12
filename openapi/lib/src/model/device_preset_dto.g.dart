// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_preset_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DevicePresetDto _$DevicePresetDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'DevicePresetDto',
      json,
      ($checkedConvert) {
        final val = DevicePresetDto(
          id: $checkedConvert('id', (v) => v as int?),
          name: $checkedConvert('name', (v) => v as String?),
          personId: $checkedConvert('personId', (v) => v as int?),
          setting: $checkedConvert(
              'setting',
              (v) => v == null
                  ? null
                  : DeviceSettingDto.fromJson(v as Map<String, dynamic>)),
        );
        return val;
      },
    );

Map<String, dynamic> _$DevicePresetDtoToJson(DevicePresetDto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('name', instance.name);
  writeNotNull('personId', instance.personId);
  writeNotNull('setting', instance.setting?.toJson());
  return val;
}
