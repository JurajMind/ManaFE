// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'smart_hookah_models_db_social_media.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SmartHookahModelsDbSocialMedia _$SmartHookahModelsDbSocialMediaFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'SmartHookahModelsDbSocialMedia',
      json,
      ($checkedConvert) {
        final val = SmartHookahModelsDbSocialMedia(
          id: $checkedConvert('Id', (v) => v as int?),
          code: $checkedConvert('Code', (v) => v as String?),
          url: $checkedConvert('Url', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {'id': 'Id', 'code': 'Code', 'url': 'Url'},
    );

Map<String, dynamic> _$SmartHookahModelsDbSocialMediaToJson(
    SmartHookahModelsDbSocialMedia instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Id', instance.id);
  writeNotNull('Code', instance.code);
  writeNotNull('Url', instance.url);
  return val;
}
