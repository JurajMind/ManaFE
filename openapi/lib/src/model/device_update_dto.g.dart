// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_update_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeviceUpdateDto _$DeviceUpdateDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'DeviceUpdateDto',
      json,
      ($checkedConvert) {
        final val = DeviceUpdateDto(
          id: $checkedConvert('Id', (v) => v as int?),
          version: $checkedConvert('Version', (v) => v as int?),
          releseDate: $checkedConvert('ReleseDate',
              (v) => v == null ? null : DateTime.parse(v as String)),
          releseNote: $checkedConvert('ReleseNote', (v) => v as String?),
          type: $checkedConvert('Type',
              (v) => $enumDecodeNullable(_$DeviceUpdateDtoTypeEnumEnumMap, v)),
        );
        return val;
      },
      fieldKeyMap: const {
        'id': 'Id',
        'version': 'Version',
        'releseDate': 'ReleseDate',
        'releseNote': 'ReleseNote',
        'type': 'Type'
      },
    );

Map<String, dynamic> _$DeviceUpdateDtoToJson(DeviceUpdateDto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Id', instance.id);
  writeNotNull('Version', instance.version);
  writeNotNull('ReleseDate', instance.releseDate?.toIso8601String());
  writeNotNull('ReleseNote', instance.releseNote);
  writeNotNull('Type', _$DeviceUpdateDtoTypeEnumEnumMap[instance.type]);
  return val;
}

const _$DeviceUpdateDtoTypeEnumEnumMap = {
  DeviceUpdateDtoTypeEnum.number0: 0,
  DeviceUpdateDtoTypeEnum.number1: 1,
  DeviceUpdateDtoTypeEnum.number2: 2,
  DeviceUpdateDtoTypeEnum.number3: 3,
};
