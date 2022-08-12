// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'smart_hookah_models_order_extra_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SmartHookahModelsOrderExtraDto _$SmartHookahModelsOrderExtraDtoFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'SmartHookahModelsOrderExtraDto',
      json,
      ($checkedConvert) {
        final val = SmartHookahModelsOrderExtraDto(
          id: $checkedConvert('Id', (v) => v as int?),
          currency: $checkedConvert('Currency', (v) => v as String?),
          price: $checkedConvert('Price', (v) => (v as num?)?.toDouble()),
          name: $checkedConvert('Name', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {
        'id': 'Id',
        'currency': 'Currency',
        'price': 'Price',
        'name': 'Name'
      },
    );

Map<String, dynamic> _$SmartHookahModelsOrderExtraDtoToJson(
    SmartHookahModelsOrderExtraDto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Id', instance.id);
  writeNotNull('Currency', instance.currency);
  writeNotNull('Price', instance.price);
  writeNotNull('Name', instance.name);
  return val;
}
