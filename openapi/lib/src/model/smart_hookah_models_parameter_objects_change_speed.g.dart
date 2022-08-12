// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'smart_hookah_models_parameter_objects_change_speed.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SmartHookahModelsParameterObjectsChangeSpeed
    _$SmartHookahModelsParameterObjectsChangeSpeedFromJson(
            Map<String, dynamic> json) =>
        $checkedCreate(
          'SmartHookahModelsParameterObjectsChangeSpeed',
          json,
          ($checkedConvert) {
            final val = SmartHookahModelsParameterObjectsChangeSpeed(
              speed: $checkedConvert('Speed', (v) => v as int?),
              type: $checkedConvert(
                  'Type',
                  (v) => $enumDecodeNullable(
                      _$SmartHookahModelsParameterObjectsChangeSpeedTypeEnumEnumMap,
                      v)),
            );
            return val;
          },
          fieldKeyMap: const {'speed': 'Speed', 'type': 'Type'},
        );

Map<String, dynamic> _$SmartHookahModelsParameterObjectsChangeSpeedToJson(
    SmartHookahModelsParameterObjectsChangeSpeed instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Speed', instance.speed);
  writeNotNull(
      'Type',
      _$SmartHookahModelsParameterObjectsChangeSpeedTypeEnumEnumMap[
          instance.type]);
  return val;
}

const _$SmartHookahModelsParameterObjectsChangeSpeedTypeEnumEnumMap = {
  SmartHookahModelsParameterObjectsChangeSpeedTypeEnum.number0: 0,
  SmartHookahModelsParameterObjectsChangeSpeedTypeEnum.number1: 1,
  SmartHookahModelsParameterObjectsChangeSpeedTypeEnum.number2: 2,
};
