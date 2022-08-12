// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'smart_hookah_models_parameter_objects_change_brightness.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SmartHookahModelsParameterObjectsChangeBrightness
    _$SmartHookahModelsParameterObjectsChangeBrightnessFromJson(
            Map<String, dynamic> json) =>
        $checkedCreate(
          'SmartHookahModelsParameterObjectsChangeBrightness',
          json,
          ($checkedConvert) {
            final val = SmartHookahModelsParameterObjectsChangeBrightness(
              brightness: $checkedConvert('Brightness', (v) => v as int?),
              type: $checkedConvert(
                  'Type',
                  (v) => $enumDecodeNullable(
                      _$SmartHookahModelsParameterObjectsChangeBrightnessTypeEnumEnumMap,
                      v)),
            );
            return val;
          },
          fieldKeyMap: const {'brightness': 'Brightness', 'type': 'Type'},
        );

Map<String, dynamic> _$SmartHookahModelsParameterObjectsChangeBrightnessToJson(
    SmartHookahModelsParameterObjectsChangeBrightness instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Brightness', instance.brightness);
  writeNotNull(
      'Type',
      _$SmartHookahModelsParameterObjectsChangeBrightnessTypeEnumEnumMap[
          instance.type]);
  return val;
}

const _$SmartHookahModelsParameterObjectsChangeBrightnessTypeEnumEnumMap = {
  SmartHookahModelsParameterObjectsChangeBrightnessTypeEnum.number0: 0,
  SmartHookahModelsParameterObjectsChangeBrightnessTypeEnum.number1: 1,
  SmartHookahModelsParameterObjectsChangeBrightnessTypeEnum.number2: 2,
};
