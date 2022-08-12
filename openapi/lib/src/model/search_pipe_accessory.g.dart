// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_pipe_accessory.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchPipeAccessory _$SearchPipeAccessoryFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'SearchPipeAccessory',
      json,
      ($checkedConvert) {
        final val = SearchPipeAccessory(
          id: $checkedConvert('Id', (v) => v as int?),
          name: $checkedConvert('Name', (v) => v as String?),
          brand: $checkedConvert('Brand', (v) => v as String?),
          type: $checkedConvert('Type', (v) => v as String?),
          nonVerified: $checkedConvert('NonVerified', (v) => v as bool?),
        );
        return val;
      },
      fieldKeyMap: const {
        'id': 'Id',
        'name': 'Name',
        'brand': 'Brand',
        'type': 'Type',
        'nonVerified': 'NonVerified'
      },
    );

Map<String, dynamic> _$SearchPipeAccessoryToJson(SearchPipeAccessory instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Id', instance.id);
  writeNotNull('Name', instance.name);
  writeNotNull('Brand', instance.brand);
  writeNotNull('Type', instance.type);
  writeNotNull('NonVerified', instance.nonVerified);
  return val;
}
