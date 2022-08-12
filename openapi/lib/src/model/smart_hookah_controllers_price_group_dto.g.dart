// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'smart_hookah_controllers_price_group_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SmartHookahControllersPriceGroupDto
    _$SmartHookahControllersPriceGroupDtoFromJson(Map<String, dynamic> json) =>
        $checkedCreate(
          'SmartHookahControllersPriceGroupDto',
          json,
          ($checkedConvert) {
            final val = SmartHookahControllersPriceGroupDto(
              id: $checkedConvert('Id', (v) => v as int?),
              name: $checkedConvert('Name', (v) => v as String?),
              price: $checkedConvert('Price', (v) => (v as num?)?.toDouble()),
            );
            return val;
          },
          fieldKeyMap: const {'id': 'Id', 'name': 'Name', 'price': 'Price'},
        );

Map<String, dynamic> _$SmartHookahControllersPriceGroupDtoToJson(
    SmartHookahControllersPriceGroupDto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Id', instance.id);
  writeNotNull('Name', instance.name);
  writeNotNull('Price', instance.price);
  return val;
}
