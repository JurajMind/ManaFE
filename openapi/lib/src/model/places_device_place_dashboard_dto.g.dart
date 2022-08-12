// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'places_device_place_dashboard_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlacesDevicePlaceDashboardDto _$PlacesDevicePlaceDashboardDtoFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'PlacesDevicePlaceDashboardDto',
      json,
      ($checkedConvert) {
        final val = PlacesDevicePlaceDashboardDto(
          device: $checkedConvert(
              'Device',
              (v) => v == null
                  ? null
                  : DeviceSimpleDto.fromJson(v as Map<String, dynamic>)),
          statistic: $checkedConvert(
              'Statistic',
              (v) => v == null
                  ? null
                  : DynamicSmokeStatisticRawDto.fromJson(
                      v as Map<String, dynamic>)),
          metaData: $checkedConvert(
              'MetaData',
              (v) => v == null
                  ? null
                  : SmokeSessionMetaDataDto.fromJson(
                      v as Map<String, dynamic>)),
          tobaccoEstimate: $checkedConvert(
              'TobaccoEstimate', (v) => (v as num?)?.toDouble()),
        );
        return val;
      },
      fieldKeyMap: const {
        'device': 'Device',
        'statistic': 'Statistic',
        'metaData': 'MetaData',
        'tobaccoEstimate': 'TobaccoEstimate'
      },
    );

Map<String, dynamic> _$PlacesDevicePlaceDashboardDtoToJson(
    PlacesDevicePlaceDashboardDto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Device', instance.device?.toJson());
  writeNotNull('Statistic', instance.statistic?.toJson());
  writeNotNull('MetaData', instance.metaData?.toJson());
  writeNotNull('TobaccoEstimate', instance.tobaccoEstimate);
  return val;
}
