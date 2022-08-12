// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pipe_accesory_like_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PipeAccesoryLikeDto _$PipeAccesoryLikeDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'PipeAccesoryLikeDto',
      json,
      ($checkedConvert) {
        final val = PipeAccesoryLikeDto(
          id: $checkedConvert('Id', (v) => v as int?),
          personId: $checkedConvert('PersonId', (v) => v as int?),
          pipeAccessoryId: $checkedConvert('PipeAccessoryId', (v) => v as int?),
          value: $checkedConvert('Value', (v) => v as int?),
        );
        return val;
      },
      fieldKeyMap: const {
        'id': 'Id',
        'personId': 'PersonId',
        'pipeAccessoryId': 'PipeAccessoryId',
        'value': 'Value'
      },
    );

Map<String, dynamic> _$PipeAccesoryLikeDtoToJson(PipeAccesoryLikeDto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Id', instance.id);
  writeNotNull('PersonId', instance.personId);
  writeNotNull('PipeAccessoryId', instance.pipeAccessoryId);
  writeNotNull('Value', instance.value);
  return val;
}
