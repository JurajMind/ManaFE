// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'init_data_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InitDataDto _$InitDataDtoFromJson(Map<String, dynamic> json) => $checkedCreate(
      'InitDataDto',
      json,
      ($checkedConvert) {
        final val = InitDataDto(
          smokeSession: $checkedConvert(
              'SmokeSession',
              (v) => v == null
                  ? null
                  : SmokeSessionSimpleDto.fromJson(v as Map<String, dynamic>)),
          deviceSettings: $checkedConvert(
              'DeviceSettings',
              (v) => v == null
                  ? null
                  : DeviceSettingDto.fromJson(v as Map<String, dynamic>)),
        );
        return val;
      },
      fieldKeyMap: const {
        'smokeSession': 'SmokeSession',
        'deviceSettings': 'DeviceSettings'
      },
    );

Map<String, dynamic> _$InitDataDtoToJson(InitDataDto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('SmokeSession', instance.smokeSession?.toJson());
  writeNotNull('DeviceSettings', instance.deviceSettings?.toJson());
  return val;
}
