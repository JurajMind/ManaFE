// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MediaDto _$MediaDtoFromJson(Map<String, dynamic> json) => $checkedCreate(
      'MediaDto',
      json,
      ($checkedConvert) {
        final val = MediaDto(
          id: $checkedConvert('Id', (v) => v as int?),
          created: $checkedConvert(
              'Created', (v) => v == null ? null : DateTime.parse(v as String)),
          path: $checkedConvert('Path', (v) => v as String?),
          type: $checkedConvert(
              'Type', (v) => $enumDecodeNullable(_$MediaDtoTypeEnumEnumMap, v)),
          isDefault: $checkedConvert('IsDefault', (v) => v as bool?),
          extension_: $checkedConvert('Extension', (v) => v as String?),
          fileName: $checkedConvert('FileName', (v) => v as String?),
          sizes: $checkedConvert('Sizes', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {
        'id': 'Id',
        'created': 'Created',
        'path': 'Path',
        'type': 'Type',
        'isDefault': 'IsDefault',
        'extension_': 'Extension',
        'fileName': 'FileName',
        'sizes': 'Sizes'
      },
    );

Map<String, dynamic> _$MediaDtoToJson(MediaDto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Id', instance.id);
  writeNotNull('Created', instance.created?.toIso8601String());
  writeNotNull('Path', instance.path);
  writeNotNull('Type', _$MediaDtoTypeEnumEnumMap[instance.type]);
  writeNotNull('IsDefault', instance.isDefault);
  writeNotNull('Extension', instance.extension_);
  writeNotNull('FileName', instance.fileName);
  writeNotNull('Sizes', instance.sizes);
  return val;
}

const _$MediaDtoTypeEnumEnumMap = {
  MediaDtoTypeEnum.number0: 0,
  MediaDtoTypeEnum.number1: 1,
};
