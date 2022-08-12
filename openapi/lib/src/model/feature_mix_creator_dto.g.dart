// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feature_mix_creator_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeatureMixCreatorDto _$FeatureMixCreatorDtoFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'FeatureMixCreatorDto',
      json,
      ($checkedConvert) {
        final val = FeatureMixCreatorDto(
          name: $checkedConvert('Name', (v) => v as String?),
          description: $checkedConvert('Description', (v) => v as String?),
          location: $checkedConvert('Location', (v) => v as String?),
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
          logoPicture: $checkedConvert('LogoPicture', (v) => v as String?),
          personId: $checkedConvert('PersonId', (v) => v as int?),
          id: $checkedConvert('Id', (v) => v as int?),
        );
        return val;
      },
      fieldKeyMap: const {
        'name': 'Name',
        'description': 'Description',
        'location': 'Location',
        'socialMedias': 'SocialMedias',
        'medias': 'Medias',
        'logoPicture': 'LogoPicture',
        'personId': 'PersonId',
        'id': 'Id'
      },
    );

Map<String, dynamic> _$FeatureMixCreatorDtoToJson(
    FeatureMixCreatorDto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Name', instance.name);
  writeNotNull('Description', instance.description);
  writeNotNull('Location', instance.location);
  writeNotNull(
      'SocialMedias', instance.socialMedias?.map((e) => e.toJson()).toList());
  writeNotNull('Medias', instance.medias?.map((e) => e.toJson()).toList());
  writeNotNull('LogoPicture', instance.logoPicture);
  writeNotNull('PersonId', instance.personId);
  writeNotNull('Id', instance.id);
  return val;
}
