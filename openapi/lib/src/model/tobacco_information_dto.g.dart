// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tobacco_information_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TobaccoInformationDto _$TobaccoInformationDtoFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'TobaccoInformationDto',
      json,
      ($checkedConvert) {
        final val = TobaccoInformationDto(
          tobacco: $checkedConvert(
              'Tobacco',
              (v) => v == null
                  ? null
                  : TobaccoSimpleDto.fromJson(v as Map<String, dynamic>)),
          tobaccoTastes: $checkedConvert(
              'TobaccoTastes',
              (v) => (v as List<dynamic>?)
                  ?.map((e) =>
                      TobaccoTasteDto.fromJson(e as Map<String, dynamic>))
                  .toList()),
          personTobaccoStats: $checkedConvert(
              'PersonTobaccoStats',
              (v) => v == null
                  ? null
                  : PipeAccessoryStatisticsDto.fromJson(
                      v as Map<String, dynamic>)),
          allTobaccoStats: $checkedConvert(
              'AllTobaccoStats',
              (v) => v == null
                  ? null
                  : PipeAccessoryStatisticsDto.fromJson(
                      v as Map<String, dynamic>)),
          smokeSessions: $checkedConvert(
              'SmokeSessions',
              (v) => (v as List<dynamic>?)
                  ?.map((e) =>
                      SmokeSessionSimpleDto.fromJson(e as Map<String, dynamic>))
                  .toList()),
          reviews: $checkedConvert(
              'Reviews',
              (v) => (v as List<dynamic>?)
                  ?.map((e) =>
                      GearTobaccoReviewDto.fromJson(e as Map<String, dynamic>))
                  .toList()),
        );
        return val;
      },
      fieldKeyMap: const {
        'tobacco': 'Tobacco',
        'tobaccoTastes': 'TobaccoTastes',
        'personTobaccoStats': 'PersonTobaccoStats',
        'allTobaccoStats': 'AllTobaccoStats',
        'smokeSessions': 'SmokeSessions',
        'reviews': 'Reviews'
      },
    );

Map<String, dynamic> _$TobaccoInformationDtoToJson(
    TobaccoInformationDto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Tobacco', instance.tobacco?.toJson());
  writeNotNull(
      'TobaccoTastes', instance.tobaccoTastes?.map((e) => e.toJson()).toList());
  writeNotNull('PersonTobaccoStats', instance.personTobaccoStats?.toJson());
  writeNotNull('AllTobaccoStats', instance.allTobaccoStats?.toJson());
  writeNotNull(
      'SmokeSessions', instance.smokeSessions?.map((e) => e.toJson()).toList());
  writeNotNull('Reviews', instance.reviews?.map((e) => e.toJson()).toList());
  return val;
}
