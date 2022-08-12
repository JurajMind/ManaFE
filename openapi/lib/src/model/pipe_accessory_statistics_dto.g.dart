// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pipe_accessory_statistics_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PipeAccessoryStatisticsDto _$PipeAccessoryStatisticsDtoFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'PipeAccessoryStatisticsDto',
      json,
      ($checkedConvert) {
        final val = PipeAccessoryStatisticsDto(
          used: $checkedConvert('Used', (v) => v as int?),
          weight: $checkedConvert('Weight', (v) => (v as num?)?.toDouble()),
          pipeAccessoryId: $checkedConvert('PipeAccessoryId', (v) => v as int?),
          smokeDurationTicks:
              $checkedConvert('SmokeDurationTicks', (v) => v as int?),
          pufCount: $checkedConvert('PufCount', (v) => (v as num?)?.toDouble()),
          blowCount:
              $checkedConvert('BlowCount', (v) => (v as num?)?.toDouble()),
          sessionDurationTick:
              $checkedConvert('SessionDurationTick', (v) => v as int?),
          packType: $checkedConvert(
              'PackType',
              (v) => $enumDecodeNullable(
                  _$PipeAccessoryStatisticsDtoPackTypeEnumEnumMap, v)),
          cut: $checkedConvert('Cut', (v) => (v as num?)?.toDouble()),
          strength: $checkedConvert('Strength', (v) => (v as num?)?.toDouble()),
          duration: $checkedConvert('Duration', (v) => (v as num?)?.toDouble()),
          taste: $checkedConvert('Taste', (v) => (v as num?)?.toDouble()),
          smoke: $checkedConvert('Smoke', (v) => (v as num?)?.toDouble()),
          overall: $checkedConvert('Overall', (v) => (v as num?)?.toDouble()),
          smokeTimePercentil: $checkedConvert(
              'SmokeTimePercentil', (v) => (v as num?)?.toDouble()),
          sessionTimePercentil: $checkedConvert(
              'SessionTimePercentil', (v) => (v as num?)?.toDouble()),
        );
        return val;
      },
      fieldKeyMap: const {
        'used': 'Used',
        'weight': 'Weight',
        'pipeAccessoryId': 'PipeAccessoryId',
        'smokeDurationTicks': 'SmokeDurationTicks',
        'pufCount': 'PufCount',
        'blowCount': 'BlowCount',
        'sessionDurationTick': 'SessionDurationTick',
        'packType': 'PackType',
        'cut': 'Cut',
        'strength': 'Strength',
        'duration': 'Duration',
        'taste': 'Taste',
        'smoke': 'Smoke',
        'overall': 'Overall',
        'smokeTimePercentil': 'SmokeTimePercentil',
        'sessionTimePercentil': 'SessionTimePercentil'
      },
    );

Map<String, dynamic> _$PipeAccessoryStatisticsDtoToJson(
    PipeAccessoryStatisticsDto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Used', instance.used);
  writeNotNull('Weight', instance.weight);
  writeNotNull('PipeAccessoryId', instance.pipeAccessoryId);
  writeNotNull('SmokeDurationTicks', instance.smokeDurationTicks);
  writeNotNull('PufCount', instance.pufCount);
  writeNotNull('BlowCount', instance.blowCount);
  writeNotNull('SessionDurationTick', instance.sessionDurationTick);
  writeNotNull('PackType',
      _$PipeAccessoryStatisticsDtoPackTypeEnumEnumMap[instance.packType]);
  writeNotNull('Cut', instance.cut);
  writeNotNull('Strength', instance.strength);
  writeNotNull('Duration', instance.duration);
  writeNotNull('Taste', instance.taste);
  writeNotNull('Smoke', instance.smoke);
  writeNotNull('Overall', instance.overall);
  writeNotNull('SmokeTimePercentil', instance.smokeTimePercentil);
  writeNotNull('SessionTimePercentil', instance.sessionTimePercentil);
  return val;
}

const _$PipeAccessoryStatisticsDtoPackTypeEnumEnumMap = {
  PipeAccessoryStatisticsDtoPackTypeEnum.number0: 0,
  PipeAccessoryStatisticsDtoPackTypeEnum.number1: 1,
  PipeAccessoryStatisticsDtoPackTypeEnum.number2: 2,
  PipeAccessoryStatisticsDtoPackTypeEnum.number3: 3,
  PipeAccessoryStatisticsDtoPackTypeEnum.number4: 4,
};
