// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'places_place_review_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlacesPlaceReviewDto _$PlacesPlaceReviewDtoFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'PlacesPlaceReviewDto',
      json,
      ($checkedConvert) {
        final val = PlacesPlaceReviewDto(
          id: $checkedConvert('id', (v) => v as int?),
          authorId: $checkedConvert('authorId', (v) => v as int?),
          author: $checkedConvert('author', (v) => v as String?),
          publishDate: $checkedConvert('publishDate',
              (v) => v == null ? null : DateTime.parse(v as String)),
          text: $checkedConvert('text', (v) => v as String?),
          service: $checkedConvert('service', (v) => v as int?),
          ambience: $checkedConvert('ambience', (v) => v as int?),
          overall: $checkedConvert('overall', (v) => v as int?),
          placeId: $checkedConvert('placeId', (v) => v as int?),
          sessionReview: $checkedConvert(
              'sessionReview',
              (v) => v == null
                  ? null
                  : SmartHookahModelsDbSessionDtoSessionPlaceReviewDto.fromJson(
                      v as Map<String, dynamic>)),
          medias: $checkedConvert(
              'medias',
              (v) => (v as List<dynamic>?)
                  ?.map((e) => MediaDto.fromJson(e as Map<String, dynamic>))
                  .toList()),
        );
        return val;
      },
    );

Map<String, dynamic> _$PlacesPlaceReviewDtoToJson(
    PlacesPlaceReviewDto instance) {
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
  writeNotNull('text', instance.text);
  writeNotNull('service', instance.service);
  writeNotNull('ambience', instance.ambience);
  writeNotNull('overall', instance.overall);
  writeNotNull('placeId', instance.placeId);
  writeNotNull('sessionReview', instance.sessionReview?.toJson());
  writeNotNull('medias', instance.medias?.map((e) => e.toJson()).toList());
  return val;
}
