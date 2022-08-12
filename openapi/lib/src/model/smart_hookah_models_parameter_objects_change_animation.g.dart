// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'smart_hookah_models_parameter_objects_change_animation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SmartHookahModelsParameterObjectsChangeAnimation
    _$SmartHookahModelsParameterObjectsChangeAnimationFromJson(
            Map<String, dynamic> json) =>
        $checkedCreate(
          'SmartHookahModelsParameterObjectsChangeAnimation',
          json,
          ($checkedConvert) {
            final val = SmartHookahModelsParameterObjectsChangeAnimation(
              animationId: $checkedConvert('AnimationId', (v) => v as int?),
              type: $checkedConvert(
                  'Type',
                  (v) => $enumDecodeNullable(
                      _$SmartHookahModelsParameterObjectsChangeAnimationTypeEnumEnumMap,
                      v)),
            );
            return val;
          },
          fieldKeyMap: const {'animationId': 'AnimationId', 'type': 'Type'},
        );

Map<String, dynamic> _$SmartHookahModelsParameterObjectsChangeAnimationToJson(
    SmartHookahModelsParameterObjectsChangeAnimation instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AnimationId', instance.animationId);
  writeNotNull(
      'Type',
      _$SmartHookahModelsParameterObjectsChangeAnimationTypeEnumEnumMap[
          instance.type]);
  return val;
}

const _$SmartHookahModelsParameterObjectsChangeAnimationTypeEnumEnumMap = {
  SmartHookahModelsParameterObjectsChangeAnimationTypeEnum.number0: 0,
  SmartHookahModelsParameterObjectsChangeAnimationTypeEnum.number1: 1,
  SmartHookahModelsParameterObjectsChangeAnimationTypeEnum.number2: 2,
};
