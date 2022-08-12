// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person_statistics_overall_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PersonStatisticsOverallDto _$PersonStatisticsOverallDtoFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'PersonStatisticsOverallDto',
      json,
      ($checkedConvert) {
        final val = PersonStatisticsOverallDto(
          timeStatistics: $checkedConvert(
              'TimeStatistics',
              (v) => v == null
                  ? null
                  : SmokeSessionTimeStatisticsDto.fromJson(
                      v as Map<String, dynamic>)),
          accessoriesUsage: $checkedConvert(
              'AccessoriesUsage',
              (v) => (v as List<dynamic>?)
                  ?.map((e) =>
                      PipeAccessoryUsageDto.fromJson(e as Map<String, dynamic>))
                  .toList()),
          smokeSessions: $checkedConvert(
              'SmokeSessions',
              (v) => (v as List<dynamic>?)
                  ?.map((e) =>
                      SmokeSessionSimpleDto.fromJson(e as Map<String, dynamic>))
                  .toList()),
        );
        return val;
      },
      fieldKeyMap: const {
        'timeStatistics': 'TimeStatistics',
        'accessoriesUsage': 'AccessoriesUsage',
        'smokeSessions': 'SmokeSessions'
      },
    );

Map<String, dynamic> _$PersonStatisticsOverallDtoToJson(
    PersonStatisticsOverallDto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('TimeStatistics', instance.timeStatistics?.toJson());
  writeNotNull('AccessoriesUsage',
      instance.accessoriesUsage?.map((e) => e.toJson()).toList());
  writeNotNull(
      'SmokeSessions', instance.smokeSessions?.map((e) => e.toJson()).toList());
  return val;
}
