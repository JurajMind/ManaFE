// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'smoke_session_meta_data_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SmokeSessionMetaDataDto _$SmokeSessionMetaDataDtoFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'SmokeSessionMetaDataDto',
      json,
      ($checkedConvert) {
        final val = SmokeSessionMetaDataDto(
          id: $checkedConvert('Id', (v) => v as int?),
          tobaccoId: $checkedConvert('TobaccoId', (v) => v as int?),
          tobacco: $checkedConvert(
              'Tobacco',
              (v) => v == null
                  ? null
                  : PipeAccesorySimpleDto.fromJson(v as Map<String, dynamic>)),
          tobaccoMix: $checkedConvert(
              'TobaccoMix',
              (v) => v == null
                  ? null
                  : TobaccoMixSimpleDto.fromJson(v as Map<String, dynamic>)),
          tobaccoWeight:
              $checkedConvert('TobaccoWeight', (v) => (v as num?)?.toDouble()),
          anonymPeopleCount:
              $checkedConvert('AnonymPeopleCount', (v) => v as int?),
          bowlId: $checkedConvert('BowlId', (v) => v as int?),
          bowl: $checkedConvert(
              'Bowl',
              (v) => v == null
                  ? null
                  : PipeAccesorySimpleDto.fromJson(v as Map<String, dynamic>)),
          pipeId: $checkedConvert('PipeId', (v) => v as int?),
          pipe: $checkedConvert(
              'Pipe',
              (v) => v == null
                  ? null
                  : PipeAccesorySimpleDto.fromJson(v as Map<String, dynamic>)),
          coalId: $checkedConvert('CoalId', (v) => v as int?),
          coal: $checkedConvert(
              'Coal',
              (v) => v == null
                  ? null
                  : PipeAccesorySimpleDto.fromJson(v as Map<String, dynamic>)),
          heatManagementId:
              $checkedConvert('HeatManagementId', (v) => v as int?),
          heatManagement: $checkedConvert(
              'HeatManagement',
              (v) => v == null
                  ? null
                  : PipeAccesorySimpleDto.fromJson(v as Map<String, dynamic>)),
          packType: $checkedConvert(
              'PackType',
              (v) => $enumDecodeNullable(
                  _$SmokeSessionMetaDataDtoPackTypeEnumEnumMap, v)),
          coalCount:
              $checkedConvert('CoalCount', (v) => (v as num?)?.toDouble()),
        );
        return val;
      },
      fieldKeyMap: const {
        'id': 'Id',
        'tobaccoId': 'TobaccoId',
        'tobacco': 'Tobacco',
        'tobaccoMix': 'TobaccoMix',
        'tobaccoWeight': 'TobaccoWeight',
        'anonymPeopleCount': 'AnonymPeopleCount',
        'bowlId': 'BowlId',
        'bowl': 'Bowl',
        'pipeId': 'PipeId',
        'pipe': 'Pipe',
        'coalId': 'CoalId',
        'coal': 'Coal',
        'heatManagementId': 'HeatManagementId',
        'heatManagement': 'HeatManagement',
        'packType': 'PackType',
        'coalCount': 'CoalCount'
      },
    );

Map<String, dynamic> _$SmokeSessionMetaDataDtoToJson(
    SmokeSessionMetaDataDto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Id', instance.id);
  writeNotNull('TobaccoId', instance.tobaccoId);
  writeNotNull('Tobacco', instance.tobacco?.toJson());
  writeNotNull('TobaccoMix', instance.tobaccoMix?.toJson());
  writeNotNull('TobaccoWeight', instance.tobaccoWeight);
  writeNotNull('AnonymPeopleCount', instance.anonymPeopleCount);
  writeNotNull('BowlId', instance.bowlId);
  writeNotNull('Bowl', instance.bowl?.toJson());
  writeNotNull('PipeId', instance.pipeId);
  writeNotNull('Pipe', instance.pipe?.toJson());
  writeNotNull('CoalId', instance.coalId);
  writeNotNull('Coal', instance.coal?.toJson());
  writeNotNull('HeatManagementId', instance.heatManagementId);
  writeNotNull('HeatManagement', instance.heatManagement?.toJson());
  writeNotNull('PackType',
      _$SmokeSessionMetaDataDtoPackTypeEnumEnumMap[instance.packType]);
  writeNotNull('CoalCount', instance.coalCount);
  return val;
}

const _$SmokeSessionMetaDataDtoPackTypeEnumEnumMap = {
  SmokeSessionMetaDataDtoPackTypeEnum.number0: 0,
  SmokeSessionMetaDataDtoPackTypeEnum.number1: 1,
  SmokeSessionMetaDataDtoPackTypeEnum.number2: 2,
  SmokeSessionMetaDataDtoPackTypeEnum.number3: 3,
  SmokeSessionMetaDataDtoPackTypeEnum.number4: 4,
};
