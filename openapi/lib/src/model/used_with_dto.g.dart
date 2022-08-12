// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'used_with_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UsedWithDto _$UsedWithDtoFromJson(Map<String, dynamic> json) => $checkedCreate(
      'UsedWithDto',
      json,
      ($checkedConvert) {
        final val = UsedWithDto(
          accessory: $checkedConvert(
              'Accessory',
              (v) => v == null
                  ? null
                  : PipeAccesorySimpleDto.fromJson(v as Map<String, dynamic>)),
          usedCount: $checkedConvert('UsedCount', (v) => v as int?),
        );
        return val;
      },
      fieldKeyMap: const {'accessory': 'Accessory', 'usedCount': 'UsedCount'},
    );

Map<String, dynamic> _$UsedWithDtoToJson(UsedWithDto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Accessory', instance.accessory?.toJson());
  writeNotNull('UsedCount', instance.usedCount);
  return val;
}
