// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'brand_group_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BrandGroupDto _$BrandGroupDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'BrandGroupDto',
      json,
      ($checkedConvert) {
        final val = BrandGroupDto(
          id: $checkedConvert('Id', (v) => v as String?),
          picture: $checkedConvert('Picture', (v) => v as String?),
          name: $checkedConvert('Name', (v) => v as String?),
          itemCount: $checkedConvert('ItemCount', (v) => v as int?),
        );
        return val;
      },
      fieldKeyMap: const {
        'id': 'Id',
        'picture': 'Picture',
        'name': 'Name',
        'itemCount': 'ItemCount'
      },
    );

Map<String, dynamic> _$BrandGroupDtoToJson(BrandGroupDto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Id', instance.id);
  writeNotNull('Picture', instance.picture);
  writeNotNull('Name', instance.name);
  writeNotNull('ItemCount', instance.itemCount);
  return val;
}
