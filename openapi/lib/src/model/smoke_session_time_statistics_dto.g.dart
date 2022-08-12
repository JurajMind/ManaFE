// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'smoke_session_time_statistics_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SmokeSessionTimeStatisticsDto _$SmokeSessionTimeStatisticsDtoFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'SmokeSessionTimeStatisticsDto',
      json,
      ($checkedConvert) {
        final val = SmokeSessionTimeStatisticsDto(
          sessionsCount: $checkedConvert('SessionsCount', (v) => v as int?),
          sessionsDuration:
              $checkedConvert('SessionsDuration', (v) => v as String?),
          smokeDuration: $checkedConvert('SmokeDuration', (v) => v as String?),
          puffCount: $checkedConvert('PuffCount', (v) => v as int?),
          dayOfWeekDistribution: $checkedConvert(
              'DayOfWeekDistribution',
              (v) => (v as Map<String, dynamic>?)?.map(
                    (k, e) => MapEntry(k, e as int),
                  )),
          sessionStartTimeDistribution: $checkedConvert(
              'SessionStartTimeDistribution',
              (v) => (v as Map<String, dynamic>?)?.map(
                    (k, e) => MapEntry(k, e as int),
                  )),
        );
        return val;
      },
      fieldKeyMap: const {
        'sessionsCount': 'SessionsCount',
        'sessionsDuration': 'SessionsDuration',
        'smokeDuration': 'SmokeDuration',
        'puffCount': 'PuffCount',
        'dayOfWeekDistribution': 'DayOfWeekDistribution',
        'sessionStartTimeDistribution': 'SessionStartTimeDistribution'
      },
    );

Map<String, dynamic> _$SmokeSessionTimeStatisticsDtoToJson(
    SmokeSessionTimeStatisticsDto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('SessionsCount', instance.sessionsCount);
  writeNotNull('SessionsDuration', instance.sessionsDuration);
  writeNotNull('SmokeDuration', instance.smokeDuration);
  writeNotNull('PuffCount', instance.puffCount);
  writeNotNull('DayOfWeekDistribution', instance.dayOfWeekDistribution);
  writeNotNull(
      'SessionStartTimeDistribution', instance.sessionStartTimeDistribution);
  return val;
}
