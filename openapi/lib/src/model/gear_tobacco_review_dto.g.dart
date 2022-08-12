// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gear_tobacco_review_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GearTobaccoReviewDto _$GearTobaccoReviewDtoFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'GearTobaccoReviewDto',
      json,
      ($checkedConvert) {
        final val = GearTobaccoReviewDto(
          id: $checkedConvert('Id', (v) => v as int?),
          cut: $checkedConvert('Cut', (v) => v as int?),
          taste: $checkedConvert('Taste', (v) => v as int?),
          smoke: $checkedConvert('Smoke', (v) => v as int?),
          strength: $checkedConvert('Strength', (v) => v as int?),
          duration: $checkedConvert('Duration', (v) => v as int?),
          overall: $checkedConvert('Overall', (v) => (v as num?)?.toDouble()),
          text: $checkedConvert('Text', (v) => v as String?),
          smokeSessionId: $checkedConvert('SmokeSessionId', (v) => v as int?),
          sessionReviewId: $checkedConvert('SessionReviewId', (v) => v as int?),
          medias: $checkedConvert(
              'Medias',
              (v) => (v as List<dynamic>?)
                  ?.map((e) => MediaDto.fromJson(e as Map<String, dynamic>))
                  .toList()),
        );
        return val;
      },
      fieldKeyMap: const {
        'id': 'Id',
        'cut': 'Cut',
        'taste': 'Taste',
        'smoke': 'Smoke',
        'strength': 'Strength',
        'duration': 'Duration',
        'overall': 'Overall',
        'text': 'Text',
        'smokeSessionId': 'SmokeSessionId',
        'sessionReviewId': 'SessionReviewId',
        'medias': 'Medias'
      },
    );

Map<String, dynamic> _$GearTobaccoReviewDtoToJson(
    GearTobaccoReviewDto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Id', instance.id);
  writeNotNull('Cut', instance.cut);
  writeNotNull('Taste', instance.taste);
  writeNotNull('Smoke', instance.smoke);
  writeNotNull('Strength', instance.strength);
  writeNotNull('Duration', instance.duration);
  writeNotNull('Overall', instance.overall);
  writeNotNull('Text', instance.text);
  writeNotNull('SmokeSessionId', instance.smokeSessionId);
  writeNotNull('SessionReviewId', instance.sessionReviewId);
  writeNotNull('Medias', instance.medias?.map((e) => e.toJson()).toList());
  return val;
}
