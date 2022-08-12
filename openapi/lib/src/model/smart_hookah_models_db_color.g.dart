// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'smart_hookah_models_db_color.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SmartHookahModelsDbColor _$SmartHookahModelsDbColorFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'SmartHookahModelsDbColor',
      json,
      ($checkedConvert) {
        final val = SmartHookahModelsDbColor(
          hue: $checkedConvert('Hue', (v) => v as int?),
          saturation: $checkedConvert('Saturation', (v) => v as int?),
          value: $checkedConvert('Value', (v) => v as int?),
        );
        return val;
      },
      fieldKeyMap: const {
        'hue': 'Hue',
        'saturation': 'Saturation',
        'value': 'Value'
      },
    );

Map<String, dynamic> _$SmartHookahModelsDbColorToJson(
    SmartHookahModelsDbColor instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Hue', instance.hue);
  writeNotNull('Saturation', instance.saturation);
  writeNotNull('Value', instance.value);
  return val;
}
