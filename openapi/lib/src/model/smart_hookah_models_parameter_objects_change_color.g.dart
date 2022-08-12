// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'smart_hookah_models_parameter_objects_change_color.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SmartHookahModelsParameterObjectsChangeColor
    _$SmartHookahModelsParameterObjectsChangeColorFromJson(
            Map<String, dynamic> json) =>
        $checkedCreate(
          'SmartHookahModelsParameterObjectsChangeColor',
          json,
          ($checkedConvert) {
            final val = SmartHookahModelsParameterObjectsChangeColor(
              color: $checkedConvert(
                  'Color',
                  (v) => v == null
                      ? null
                      : SmartHookahModelsDbColor.fromJson(
                          v as Map<String, dynamic>)),
              type: $checkedConvert(
                  'Type',
                  (v) => $enumDecodeNullable(
                      _$SmartHookahModelsParameterObjectsChangeColorTypeEnumEnumMap,
                      v)),
            );
            return val;
          },
          fieldKeyMap: const {'color': 'Color', 'type': 'Type'},
        );

Map<String, dynamic> _$SmartHookahModelsParameterObjectsChangeColorToJson(
    SmartHookahModelsParameterObjectsChangeColor instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Color', instance.color?.toJson());
  writeNotNull(
      'Type',
      _$SmartHookahModelsParameterObjectsChangeColorTypeEnumEnumMap[
          instance.type]);
  return val;
}

const _$SmartHookahModelsParameterObjectsChangeColorTypeEnumEnumMap = {
  SmartHookahModelsParameterObjectsChangeColorTypeEnum.number0: 0,
  SmartHookahModelsParameterObjectsChangeColorTypeEnum.number1: 1,
  SmartHookahModelsParameterObjectsChangeColorTypeEnum.number2: 2,
};
