// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'brand_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BrandDto _$BrandDtoFromJson(Map<String, dynamic> json) => $checkedCreate(
      'BrandDto',
      json,
      ($checkedConvert) {
        final val = BrandDto(
          name: $checkedConvert('Name', (v) => v as String?),
          url: $checkedConvert('Url', (v) => v as String?),
          picture: $checkedConvert('Picture', (v) => v as String?),
          tobacco: $checkedConvert('Tobacco', (v) => v as bool?),
          bowl: $checkedConvert('Bowl', (v) => v as bool?),
          hookah: $checkedConvert('Hookah', (v) => v as bool?),
          coal: $checkedConvert('Coal', (v) => v as bool?),
          heatManagment: $checkedConvert('HeatManagment', (v) => v as bool?),
          tobaccoMixBrand:
              $checkedConvert('TobaccoMixBrand', (v) => v as bool?),
          pipeAccessories: $checkedConvert(
              'PipeAccessories',
              (v) => (v as List<dynamic>?)
                  ?.map((e) =>
                      PipeAccesorySimpleDto.fromJson(e as Map<String, dynamic>))
                  .toList()),
          socialMedias: $checkedConvert(
              'SocialMedias',
              (v) => (v as List<dynamic>?)
                  ?.map((e) => SmartHookahModelsDbSocialMedia.fromJson(
                      e as Map<String, dynamic>))
                  .toList()),
          medias: $checkedConvert(
              'Medias',
              (v) => (v as List<dynamic>?)
                  ?.map((e) => MediaDto.fromJson(e as Map<String, dynamic>))
                  .toList()),
          displayName: $checkedConvert('DisplayName', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {
        'name': 'Name',
        'url': 'Url',
        'picture': 'Picture',
        'tobacco': 'Tobacco',
        'bowl': 'Bowl',
        'hookah': 'Hookah',
        'coal': 'Coal',
        'heatManagment': 'HeatManagment',
        'tobaccoMixBrand': 'TobaccoMixBrand',
        'pipeAccessories': 'PipeAccessories',
        'socialMedias': 'SocialMedias',
        'medias': 'Medias',
        'displayName': 'DisplayName'
      },
    );

Map<String, dynamic> _$BrandDtoToJson(BrandDto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Name', instance.name);
  writeNotNull('Url', instance.url);
  writeNotNull('Picture', instance.picture);
  writeNotNull('Tobacco', instance.tobacco);
  writeNotNull('Bowl', instance.bowl);
  writeNotNull('Hookah', instance.hookah);
  writeNotNull('Coal', instance.coal);
  writeNotNull('HeatManagment', instance.heatManagment);
  writeNotNull('TobaccoMixBrand', instance.tobaccoMixBrand);
  writeNotNull('PipeAccessories',
      instance.pipeAccessories?.map((e) => e.toJson()).toList());
  writeNotNull(
      'SocialMedias', instance.socialMedias?.map((e) => e.toJson()).toList());
  writeNotNull('Medias', instance.medias?.map((e) => e.toJson()).toList());
  writeNotNull('DisplayName', instance.displayName);
  return val;
}
