// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'smart_hookah_models_db_session_dto_session_place_review_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SmartHookahModelsDbSessionDtoSessionPlaceReviewDto
    _$SmartHookahModelsDbSessionDtoSessionPlaceReviewDtoFromJson(
            Map<String, dynamic> json) =>
        $checkedCreate(
          'SmartHookahModelsDbSessionDtoSessionPlaceReviewDto',
          json,
          ($checkedConvert) {
            final val = SmartHookahModelsDbSessionDtoSessionPlaceReviewDto(
              id: $checkedConvert('id', (v) => v as int?),
              authorId: $checkedConvert('authorId', (v) => v as int?),
              author: $checkedConvert('author', (v) => v as String?),
              publishDate: $checkedConvert('publishDate',
                  (v) => v == null ? null : DateTime.parse(v as String)),
              tobaccoReview: $checkedConvert(
                  'tobaccoReview',
                  (v) => v == null
                      ? null
                      : GearTobaccoReviewDto.fromJson(
                          v as Map<String, dynamic>)),
              medias: $checkedConvert(
                  'medias',
                  (v) => (v as List<dynamic>?)
                      ?.map((e) => MediaDto.fromJson(e as Map<String, dynamic>))
                      .toList()),
              smokeSessionId:
                  $checkedConvert('smokeSessionId', (v) => v as int?),
              smokeSession: $checkedConvert(
                  'smokeSession',
                  (v) => v == null
                      ? null
                      : SmokeSessionSimpleDto.fromJson(
                          v as Map<String, dynamic>)),
            );
            return val;
          },
        );

Map<String, dynamic> _$SmartHookahModelsDbSessionDtoSessionPlaceReviewDtoToJson(
    SmartHookahModelsDbSessionDtoSessionPlaceReviewDto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('authorId', instance.authorId);
  writeNotNull('author', instance.author);
  writeNotNull('publishDate', instance.publishDate?.toIso8601String());
  writeNotNull('tobaccoReview', instance.tobaccoReview?.toJson());
  writeNotNull('medias', instance.medias?.map((e) => e.toJson()).toList());
  writeNotNull('smokeSessionId', instance.smokeSessionId);
  writeNotNull('smokeSession', instance.smokeSession?.toJson());
  return val;
}
