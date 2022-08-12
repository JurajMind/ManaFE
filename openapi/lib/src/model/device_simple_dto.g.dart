// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_simple_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeviceSimpleDto _$DeviceSimpleDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'DeviceSimpleDto',
      json,
      ($checkedConvert) {
        final val = DeviceSimpleDto(
          id: $checkedConvert('Id', (v) => v as int?),
          name: $checkedConvert('Name', (v) => v as String?),
          code: $checkedConvert('Code', (v) => v as String?),
          isOnline: $checkedConvert('IsOnline', (v) => v as bool?),
          type: $checkedConvert('Type',
              (v) => $enumDecodeNullable(_$DeviceSimpleDtoTypeEnumEnumMap, v)),
          version: $checkedConvert('Version', (v) => v as int?),
        );
        return val;
      },
      fieldKeyMap: const {
        'id': 'Id',
        'name': 'Name',
        'code': 'Code',
        'isOnline': 'IsOnline',
        'type': 'Type',
        'version': 'Version'
      },
    );

Map<String, dynamic> _$DeviceSimpleDtoToJson(DeviceSimpleDto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Id', instance.id);
  writeNotNull('Name', instance.name);
  writeNotNull('Code', instance.code);
  writeNotNull('IsOnline', instance.isOnline);
  writeNotNull('Type', _$DeviceSimpleDtoTypeEnumEnumMap[instance.type]);
  writeNotNull('Version', instance.version);
  return val;
}

const _$DeviceSimpleDtoTypeEnumEnumMap = {
  DeviceSimpleDtoTypeEnum.number0: 0,
  DeviceSimpleDtoTypeEnum.number1: 1,
  DeviceSimpleDtoTypeEnum.number2: 2,
  DeviceSimpleDtoTypeEnum.number3: 3,
  DeviceSimpleDtoTypeEnum.number4: 4,
  DeviceSimpleDtoTypeEnum.number5: 5,
  DeviceSimpleDtoTypeEnum.number6: 6,
  DeviceSimpleDtoTypeEnum.number7: 7,
  DeviceSimpleDtoTypeEnum.number8: 8,
  DeviceSimpleDtoTypeEnum.number9: 9,
  DeviceSimpleDtoTypeEnum.number10: 10,
  DeviceSimpleDtoTypeEnum.number11: 11,
  DeviceSimpleDtoTypeEnum.number12: 12,
  DeviceSimpleDtoTypeEnum.number13: 13,
};
