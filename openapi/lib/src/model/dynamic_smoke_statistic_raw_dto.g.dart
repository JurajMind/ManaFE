// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dynamic_smoke_statistic_raw_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DynamicSmokeStatisticRawDto _$DynamicSmokeStatisticRawDtoFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'DynamicSmokeStatisticRawDto',
      json,
      ($checkedConvert) {
        final val = DynamicSmokeStatisticRawDto(
          pufCount: $checkedConvert('PufCount', (v) => v as int?),
          lastPuf: $checkedConvert('LastPuf', (v) => v as int?),
          lastPufTime: $checkedConvert('LastPufTime', (v) => v as int?),
          smokeDuration: $checkedConvert('SmokeDuration', (v) => v as int?),
          longestPuf: $checkedConvert('LongestPuf', (v) => v as int?),
          start: $checkedConvert('Start', (v) => v as int?),
          duration: $checkedConvert('Duration', (v) => v as int?),
          longestPufMilis: $checkedConvert('LongestPufMilis', (v) => v as int?),
        );
        return val;
      },
      fieldKeyMap: const {
        'pufCount': 'PufCount',
        'lastPuf': 'LastPuf',
        'lastPufTime': 'LastPufTime',
        'smokeDuration': 'SmokeDuration',
        'longestPuf': 'LongestPuf',
        'start': 'Start',
        'duration': 'Duration',
        'longestPufMilis': 'LongestPufMilis'
      },
    );

Map<String, dynamic> _$DynamicSmokeStatisticRawDtoToJson(
    DynamicSmokeStatisticRawDto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('PufCount', instance.pufCount);
  writeNotNull('LastPuf', instance.lastPuf);
  writeNotNull('LastPufTime', instance.lastPufTime);
  writeNotNull('SmokeDuration', instance.smokeDuration);
  writeNotNull('LongestPuf', instance.longestPuf);
  writeNotNull('Start', instance.start);
  writeNotNull('Duration', instance.duration);
  writeNotNull('LongestPufMilis', instance.longestPufMilis);
  return val;
}
