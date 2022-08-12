// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'smoke_session_simple_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SmokeSessionSimpleDto _$SmokeSessionSimpleDtoFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'SmokeSessionSimpleDto',
      json,
      ($checkedConvert) {
        final val = SmokeSessionSimpleDto(
          id: $checkedConvert('Id', (v) => v as int?),
          live: $checkedConvert('Live', (v) => v as bool?),
          sessionId: $checkedConvert('SessionId', (v) => v as String?),
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
          placeId: $checkedConvert('PlaceId', (v) => v as int?),
          placeName: $checkedConvert('PlaceName', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {
        'id': 'Id',
        'live': 'Live',
        'sessionId': 'SessionId',
        'device': 'Device',
        'statistic': 'Statistic',
        'metaData': 'MetaData',
        'placeId': 'PlaceId',
        'placeName': 'PlaceName'
      },
    );

Map<String, dynamic> _$SmokeSessionSimpleDtoToJson(
    SmokeSessionSimpleDto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Id', instance.id);
  writeNotNull('Live', instance.live);
  writeNotNull('SessionId', instance.sessionId);
  writeNotNull('Device', instance.device?.toJson());
  writeNotNull('Statistic', instance.statistic?.toJson());
  writeNotNull('MetaData', instance.metaData?.toJson());
  writeNotNull('PlaceId', instance.placeId);
  writeNotNull('PlaceName', instance.placeName);
  return val;
}
