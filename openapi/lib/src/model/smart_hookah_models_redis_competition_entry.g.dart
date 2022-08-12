// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'smart_hookah_models_redis_competition_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SmartHookahModelsRedisCompetitionEntry
    _$SmartHookahModelsRedisCompetitionEntryFromJson(
            Map<String, dynamic> json) =>
        $checkedCreate(
          'SmartHookahModelsRedisCompetitionEntry',
          json,
          ($checkedConvert) {
            final val = SmartHookahModelsRedisCompetitionEntry(
              name: $checkedConvert('Name', (v) => v as String?),
              time: $checkedConvert('Time', (v) => (v as num?)?.toDouble()),
            );
            return val;
          },
          fieldKeyMap: const {'name': 'Name', 'time': 'Time'},
        );

Map<String, dynamic> _$SmartHookahModelsRedisCompetitionEntryToJson(
    SmartHookahModelsRedisCompetitionEntry instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Name', instance.name);
  writeNotNull('Time', instance.time);
  return val;
}
