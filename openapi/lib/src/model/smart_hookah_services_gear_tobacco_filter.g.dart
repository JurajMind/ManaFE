// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'smart_hookah_services_gear_tobacco_filter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SmartHookahServicesGearTobaccoFilter
    _$SmartHookahServicesGearTobaccoFilterFromJson(Map<String, dynamic> json) =>
        $checkedCreate(
          'SmartHookahServicesGearTobaccoFilter',
          json,
          ($checkedConvert) {
            final val = SmartHookahServicesGearTobaccoFilter(
              tastes: $checkedConvert('Tastes',
                  (v) => (v as List<dynamic>?)?.map((e) => e as int).toList()),
              sortBy: $checkedConvert(
                  'SortBy',
                  (v) => $enumDecodeNullable(
                      _$SmartHookahServicesGearTobaccoFilterSortByEnumEnumMap,
                      v)),
              brand: $checkedConvert('Brand', (v) => v as String?),
              owned: $checkedConvert('Owned', (v) => v as bool?),
              smoked: $checkedConvert('Smoked', (v) => v as bool?),
              sortDirection: $checkedConvert(
                  'SortDirection',
                  (v) => $enumDecodeNullable(
                      _$SmartHookahServicesGearTobaccoFilterSortDirectionEnumEnumMap,
                      v)),
            );
            return val;
          },
          fieldKeyMap: const {
            'tastes': 'Tastes',
            'sortBy': 'SortBy',
            'brand': 'Brand',
            'owned': 'Owned',
            'smoked': 'Smoked',
            'sortDirection': 'SortDirection'
          },
        );

Map<String, dynamic> _$SmartHookahServicesGearTobaccoFilterToJson(
    SmartHookahServicesGearTobaccoFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Tastes', instance.tastes);
  writeNotNull('SortBy',
      _$SmartHookahServicesGearTobaccoFilterSortByEnumEnumMap[instance.sortBy]);
  writeNotNull('Brand', instance.brand);
  writeNotNull('Owned', instance.owned);
  writeNotNull('Smoked', instance.smoked);
  writeNotNull(
      'SortDirection',
      _$SmartHookahServicesGearTobaccoFilterSortDirectionEnumEnumMap[
          instance.sortDirection]);
  return val;
}

const _$SmartHookahServicesGearTobaccoFilterSortByEnumEnumMap = {
  SmartHookahServicesGearTobaccoFilterSortByEnum.number0: 0,
  SmartHookahServicesGearTobaccoFilterSortByEnum.number1: 1,
  SmartHookahServicesGearTobaccoFilterSortByEnum.number2: 2,
  SmartHookahServicesGearTobaccoFilterSortByEnum.number3: 3,
  SmartHookahServicesGearTobaccoFilterSortByEnum.number4: 4,
};

const _$SmartHookahServicesGearTobaccoFilterSortDirectionEnumEnumMap = {
  SmartHookahServicesGearTobaccoFilterSortDirectionEnum.number0: 0,
  SmartHookahServicesGearTobaccoFilterSortDirectionEnum.number1: 1,
};
