// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pipe_accessory_usage_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PipeAccessoryUsageDto _$PipeAccessoryUsageDtoFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'PipeAccessoryUsageDto',
      json,
      ($checkedConvert) {
        final val = PipeAccessoryUsageDto(
          id: $checkedConvert('Id', (v) => v as int?),
          brandName: $checkedConvert('BrandName', (v) => v as String?),
          accName: $checkedConvert('AccName', (v) => v as String?),
          type: $checkedConvert('Type', (v) => v as String?),
          used: $checkedConvert('Used', (v) => v as int?),
          owned: $checkedConvert('Owned', (v) => v as bool?),
          inMix: $checkedConvert('InMix', (v) => v as int?),
        );
        return val;
      },
      fieldKeyMap: const {
        'id': 'Id',
        'brandName': 'BrandName',
        'accName': 'AccName',
        'type': 'Type',
        'used': 'Used',
        'owned': 'Owned',
        'inMix': 'InMix'
      },
    );

Map<String, dynamic> _$PipeAccessoryUsageDtoToJson(
    PipeAccessoryUsageDto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Id', instance.id);
  writeNotNull('BrandName', instance.brandName);
  writeNotNull('AccName', instance.accName);
  writeNotNull('Type', instance.type);
  writeNotNull('Used', instance.used);
  writeNotNull('Owned', instance.owned);
  writeNotNull('InMix', instance.inMix);
  return val;
}
