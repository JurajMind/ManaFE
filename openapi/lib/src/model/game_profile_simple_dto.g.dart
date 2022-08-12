// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_profile_simple_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameProfileSimpleDto _$GameProfileSimpleDtoFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'GameProfileSimpleDto',
      json,
      ($checkedConvert) {
        final val = GameProfileSimpleDto(
          personId: $checkedConvert('PersonId', (v) => v as int?),
          level: $checkedConvert('Level', (v) => v as int?),
          testLevel: $checkedConvert('TestLevel', (v) => v as int?),
          lvlProgress:
              $checkedConvert('LvlProgress', (v) => (v as num?)?.toDouble()),
          experience: $checkedConvert('Experience', (v) => v as int?),
          clouds: $checkedConvert('Clouds', (v) => v as int?),
          picture: $checkedConvert(
              'Picture',
              (v) => v == null
                  ? null
                  : GamePictureDto.fromJson(v as Map<String, dynamic>)),
        );
        return val;
      },
      fieldKeyMap: const {
        'personId': 'PersonId',
        'level': 'Level',
        'testLevel': 'TestLevel',
        'lvlProgress': 'LvlProgress',
        'experience': 'Experience',
        'clouds': 'Clouds',
        'picture': 'Picture'
      },
    );

Map<String, dynamic> _$GameProfileSimpleDtoToJson(
    GameProfileSimpleDto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('PersonId', instance.personId);
  writeNotNull('Level', instance.level);
  writeNotNull('TestLevel', instance.testLevel);
  writeNotNull('LvlProgress', instance.lvlProgress);
  writeNotNull('Experience', instance.experience);
  writeNotNull('Clouds', instance.clouds);
  writeNotNull('Picture', instance.picture?.toJson());
  return val;
}
