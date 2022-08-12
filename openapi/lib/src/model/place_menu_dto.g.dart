// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_menu_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlaceMenuDto _$PlaceMenuDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'PlaceMenuDto',
      json,
      ($checkedConvert) {
        final val = PlaceMenuDto(
          accessories: $checkedConvert(
              'Accessories',
              (v) => (v as List<dynamic>?)
                  ?.map((e) =>
                      PipeAccesorySimpleDto.fromJson(e as Map<String, dynamic>))
                  .toList()),
          tobaccoMixes: $checkedConvert(
              'TobaccoMixes',
              (v) => (v as List<dynamic>?)
                  ?.map((e) =>
                      TobaccoMixSimpleDto.fromJson(e as Map<String, dynamic>))
                  .toList()),
          orderExtras: $checkedConvert(
              'OrderExtras',
              (v) => (v as List<dynamic>?)
                  ?.map((e) => SmartHookahModelsOrderExtraDto.fromJson(
                      e as Map<String, dynamic>))
                  .toList()),
          basePrice:
              $checkedConvert('BasePrice', (v) => (v as num?)?.toDouble()),
          currency: $checkedConvert('Currency', (v) => v as String?),
          priceGroup: $checkedConvert(
              'PriceGroup',
              (v) => (v as List<dynamic>?)
                  ?.map((e) => SmartHookahControllersPriceGroupDto.fromJson(
                      e as Map<String, dynamic>))
                  .toList()),
          prices: $checkedConvert(
              'Prices',
              (v) => (v as List<dynamic>?)
                  ?.map((e) =>
                      PriceGroupItems.fromJson(e as Map<String, dynamic>))
                  .toList()),
        );
        return val;
      },
      fieldKeyMap: const {
        'accessories': 'Accessories',
        'tobaccoMixes': 'TobaccoMixes',
        'orderExtras': 'OrderExtras',
        'basePrice': 'BasePrice',
        'currency': 'Currency',
        'priceGroup': 'PriceGroup',
        'prices': 'Prices'
      },
    );

Map<String, dynamic> _$PlaceMenuDtoToJson(PlaceMenuDto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'Accessories', instance.accessories?.map((e) => e.toJson()).toList());
  writeNotNull(
      'TobaccoMixes', instance.tobaccoMixes?.map((e) => e.toJson()).toList());
  writeNotNull(
      'OrderExtras', instance.orderExtras?.map((e) => e.toJson()).toList());
  writeNotNull('BasePrice', instance.basePrice);
  writeNotNull('Currency', instance.currency);
  writeNotNull(
      'PriceGroup', instance.priceGroup?.map((e) => e.toJson()).toList());
  writeNotNull('Prices', instance.prices?.map((e) => e.toJson()).toList());
  return val;
}
