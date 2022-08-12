// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'action_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActionSettings _$ActionSettingsFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'ActionSettings',
      json,
      ($checkedConvert) {
        final val = ActionSettings(
          color: $checkedConvert(
              'Color',
              (v) => v == null
                  ? null
                  : SmartHookahModelsDbColor.fromJson(
                      v as Map<String, dynamic>)),
          animationId: $checkedConvert('AnimationId', (v) => v as int?),
          brightness: $checkedConvert('Brightness', (v) => v as int?),
          speed: $checkedConvert('Speed', (v) => v as int?),
        );
        return val;
      },
      fieldKeyMap: const {
        'color': 'Color',
        'animationId': 'AnimationId',
        'brightness': 'Brightness',
        'speed': 'Speed'
      },
    );

Map<String, dynamic> _$ActionSettingsToJson(ActionSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Color', instance.color?.toJson());
  writeNotNull('AnimationId', instance.animationId);
  writeNotNull('Brightness', instance.brightness);
  writeNotNull('Speed', instance.speed);
  return val;
}
