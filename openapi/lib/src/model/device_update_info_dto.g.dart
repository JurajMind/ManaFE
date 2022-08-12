// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_update_info_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeviceUpdateInfoDto _$DeviceUpdateInfoDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'DeviceUpdateInfoDto',
      json,
      ($checkedConvert) {
        final val = DeviceUpdateInfoDto(
          stableVersion: $checkedConvert(
              'StableVersion',
              (v) => v == null
                  ? null
                  : DeviceUpdateDto.fromJson(v as Map<String, dynamic>)),
          betaVersion: $checkedConvert(
              'BetaVersion',
              (v) => v == null
                  ? null
                  : DeviceUpdateDto.fromJson(v as Map<String, dynamic>)),
        );
        return val;
      },
      fieldKeyMap: const {
        'stableVersion': 'StableVersion',
        'betaVersion': 'BetaVersion'
      },
    );

Map<String, dynamic> _$DeviceUpdateInfoDtoToJson(DeviceUpdateInfoDto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('StableVersion', instance.stableVersion?.toJson());
  writeNotNull('BetaVersion', instance.betaVersion?.toJson());
  return val;
}
