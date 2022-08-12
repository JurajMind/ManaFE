// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'smoke_session_statistics_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SmokeSessionStatisticsDto _$SmokeSessionStatisticsDtoFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'SmokeSessionStatisticsDto',
      json,
      ($checkedConvert) {
        final val = SmokeSessionStatisticsDto(
          id: $checkedConvert('id', (v) => v as int?),
          start: $checkedConvert(
              'start', (v) => v == null ? null : DateTime.parse(v as String)),
          end: $checkedConvert(
              'end', (v) => v == null ? null : DateTime.parse(v as String)),
          smokeDuration: $checkedConvert('smokeDuration', (v) => v as String?),
          longestPuf: $checkedConvert('longestPuf', (v) => v as String?),
          pufCount: $checkedConvert('pufCount', (v) => v as int?),
          estimatedPersonCount:
              $checkedConvert('estimatedPersonCount', (v) => v as int?),
          sessionDuration:
              $checkedConvert('sessionDuration', (v) => v as String?),
        );
        return val;
      },
    );

Map<String, dynamic> _$SmokeSessionStatisticsDtoToJson(
    SmokeSessionStatisticsDto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('start', instance.start?.toIso8601String());
  writeNotNull('end', instance.end?.toIso8601String());
  writeNotNull('smokeDuration', instance.smokeDuration);
  writeNotNull('longestPuf', instance.longestPuf);
  writeNotNull('pufCount', instance.pufCount);
  writeNotNull('estimatedPersonCount', instance.estimatedPersonCount);
  writeNotNull('sessionDuration', instance.sessionDuration);
  return val;
}
