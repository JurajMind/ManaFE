// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feature_mix_creator_simple_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeatureMixCreatorSimpleDto _$FeatureMixCreatorSimpleDtoFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'FeatureMixCreatorSimpleDto',
      json,
      ($checkedConvert) {
        final val = FeatureMixCreatorSimpleDto(
          name: $checkedConvert('Name', (v) => v as String?),
          description: $checkedConvert('Description', (v) => v as String?),
          location: $checkedConvert('Location', (v) => v as String?),
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
        'logoPicture': 'LogoPicture',
        'personId': 'PersonId',
        'id': 'Id'
      },
    );

Map<String, dynamic> _$FeatureMixCreatorSimpleDtoToJson(
    FeatureMixCreatorSimpleDto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Name', instance.name);
  writeNotNull('Description', instance.description);
  writeNotNull('Location', instance.location);
  writeNotNull('LogoPicture', instance.logoPicture);
  writeNotNull('PersonId', instance.personId);
  writeNotNull('Id', instance.id);
  return val;
}
