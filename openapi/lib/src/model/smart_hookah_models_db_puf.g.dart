// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'smart_hookah_models_db_puf.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SmartHookahModelsDbPuf _$SmartHookahModelsDbPufFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'SmartHookahModelsDbPuf',
      json,
      ($checkedConvert) {
        final val = SmartHookahModelsDbPuf(
          sId: $checkedConvert('SId', (v) => v as String?),
          T: $checkedConvert(
              'T',
              (v) =>
                  $enumDecodeNullable(_$SmartHookahModelsDbPufTEnumEnumMap, v)),
          D: $checkedConvert(
              'D', (v) => v == null ? null : DateTime.parse(v as String)),
          M: $checkedConvert('M', (v) => v as int?),
          P: $checkedConvert('P', (v) => v as int?),
        );
        return val;
      },
      fieldKeyMap: const {'sId': 'SId'},
    );

Map<String, dynamic> _$SmartHookahModelsDbPufToJson(
    SmartHookahModelsDbPuf instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('SId', instance.sId);
  writeNotNull('T', _$SmartHookahModelsDbPufTEnumEnumMap[instance.T]);
  writeNotNull('D', instance.D?.toIso8601String());
  writeNotNull('M', instance.M);
  writeNotNull('P', instance.P);
  return val;
}

const _$SmartHookahModelsDbPufTEnumEnumMap = {
  SmartHookahModelsDbPufTEnum.number0: 0,
  SmartHookahModelsDbPufTEnum.number1: 1,
  SmartHookahModelsDbPufTEnum.number2: 2,
};
