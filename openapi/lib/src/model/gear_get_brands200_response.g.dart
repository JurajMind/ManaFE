// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gear_get_brands200_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GearGetBrands200Response _$GearGetBrands200ResponseFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'GearGetBrands200Response',
      json,
      ($checkedConvert) {
        final val = GearGetBrands200Response(
          bowl: $checkedConvert(
              'Bowl',
              (v) => (v as List<dynamic>?)
                  ?.map(
                      (e) => BrandGroupDto.fromJson(e as Map<String, dynamic>))
                  .toList()),
          tobacco: $checkedConvert(
              'Tobacco',
              (v) => (v as List<dynamic>?)
                  ?.map(
                      (e) => BrandGroupDto.fromJson(e as Map<String, dynamic>))
                  .toList()),
          tobaccoMix: $checkedConvert(
              'TobaccoMix',
              (v) => (v as List<dynamic>?)
                  ?.map(
                      (e) => BrandGroupDto.fromJson(e as Map<String, dynamic>))
                  .toList()),
          heatmanagement: $checkedConvert(
              'Heatmanagement',
              (v) => (v as List<dynamic>?)
                  ?.map(
                      (e) => BrandGroupDto.fromJson(e as Map<String, dynamic>))
                  .toList()),
          hookah: $checkedConvert(
              'Hookah',
              (v) => (v as List<dynamic>?)
                  ?.map(
                      (e) => BrandGroupDto.fromJson(e as Map<String, dynamic>))
                  .toList()),
          coal: $checkedConvert(
              'Coal',
              (v) => (v as List<dynamic>?)
                  ?.map(
                      (e) => BrandGroupDto.fromJson(e as Map<String, dynamic>))
                  .toList()),
        );
        return val;
      },
      fieldKeyMap: const {
        'bowl': 'Bowl',
        'tobacco': 'Tobacco',
        'tobaccoMix': 'TobaccoMix',
        'heatmanagement': 'Heatmanagement',
        'hookah': 'Hookah',
        'coal': 'Coal'
      },
    );

Map<String, dynamic> _$GearGetBrands200ResponseToJson(
    GearGetBrands200Response instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Bowl', instance.bowl?.map((e) => e.toJson()).toList());
  writeNotNull('Tobacco', instance.tobacco?.map((e) => e.toJson()).toList());
  writeNotNull(
      'TobaccoMix', instance.tobaccoMix?.map((e) => e.toJson()).toList());
  writeNotNull('Heatmanagement',
      instance.heatmanagement?.map((e) => e.toJson()).toList());
  writeNotNull('Hookah', instance.hookah?.map((e) => e.toJson()).toList());
  writeNotNull('Coal', instance.coal?.map((e) => e.toJson()).toList());
  return val;
}
