// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'finished_session_data_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FinishedSessionDataDto _$FinishedSessionDataDtoFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'FinishedSessionDataDto',
      json,
      ($checkedConvert) {
        final val = FinishedSessionDataDto(
          data: $checkedConvert(
              'Data',
              (v) => v == null
                  ? null
                  : SmokeSessionSimpleDto.fromJson(v as Map<String, dynamic>)),
          metaData: $checkedConvert(
              'MetaData',
              (v) => v == null
                  ? null
                  : SmokeSessionMetaDataDto.fromJson(
                      v as Map<String, dynamic>)),
          statistics: $checkedConvert(
              'Statistics',
              (v) => v == null
                  ? null
                  : SmokeSessionStatisticsDto.fromJson(
                      v as Map<String, dynamic>)),
          assigned: $checkedConvert('Assigned', (v) => v as bool?),
        );
        return val;
      },
      fieldKeyMap: const {
        'data': 'Data',
        'metaData': 'MetaData',
        'statistics': 'Statistics',
        'assigned': 'Assigned'
      },
    );

Map<String, dynamic> _$FinishedSessionDataDtoToJson(
    FinishedSessionDataDto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Data', instance.data?.toJson());
  writeNotNull('MetaData', instance.metaData?.toJson());
  writeNotNull('Statistics', instance.statistics?.toJson());
  writeNotNull('Assigned', instance.assigned);
  return val;
}
