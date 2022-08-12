// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'smart_hookah_helpers_animation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SmartHookahHelpersAnimation _$SmartHookahHelpersAnimationFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'SmartHookahHelpersAnimation',
      json,
      ($checkedConvert) {
        final val = SmartHookahHelpersAnimation(
          id: $checkedConvert('Id', (v) => v as int?),
          displayName: $checkedConvert('DisplayName', (v) => v as String?),
          versionFrom: $checkedConvert('VersionFrom', (v) => v as int?),
          versionTo: $checkedConvert('VersionTo', (v) => v as int?),
          usage: $checkedConvert(
              'Usage',
              (v) => $enumDecodeNullable(
                  _$SmartHookahHelpersAnimationUsageEnumEnumMap, v)),
          haveColor: $checkedConvert('HaveColor', (v) => v as bool?),
        );
        return val;
      },
      fieldKeyMap: const {
        'id': 'Id',
        'displayName': 'DisplayName',
        'versionFrom': 'VersionFrom',
        'versionTo': 'VersionTo',
        'usage': 'Usage',
        'haveColor': 'HaveColor'
      },
    );

Map<String, dynamic> _$SmartHookahHelpersAnimationToJson(
    SmartHookahHelpersAnimation instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Id', instance.id);
  writeNotNull('DisplayName', instance.displayName);
  writeNotNull('VersionFrom', instance.versionFrom);
  writeNotNull('VersionTo', instance.versionTo);
  writeNotNull(
      'Usage', _$SmartHookahHelpersAnimationUsageEnumEnumMap[instance.usage]);
  writeNotNull('HaveColor', instance.haveColor);
  return val;
}

const _$SmartHookahHelpersAnimationUsageEnumEnumMap = {
  SmartHookahHelpersAnimationUsageEnum.number0: 0,
  SmartHookahHelpersAnimationUsageEnum.number1: 1,
  SmartHookahHelpersAnimationUsageEnum.number2: 2,
  SmartHookahHelpersAnimationUsageEnum.number4: 4,
  SmartHookahHelpersAnimationUsageEnum.number6: 6,
  SmartHookahHelpersAnimationUsageEnum.number7: 7,
};
