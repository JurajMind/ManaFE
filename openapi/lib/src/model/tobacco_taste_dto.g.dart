// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tobacco_taste_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TobaccoTasteDto _$TobaccoTasteDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'TobaccoTasteDto',
      json,
      ($checkedConvert) {
        final val = TobaccoTasteDto(
          czName: $checkedConvert('CzName', (v) => v as String?),
          engName: $checkedConvert('EngName', (v) => v as String?),
          id: $checkedConvert('Id', (v) => v as int?),
          originalName: $checkedConvert('OriginalName', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {
        'czName': 'CzName',
        'engName': 'EngName',
        'id': 'Id',
        'originalName': 'OriginalName'
      },
    );

Map<String, dynamic> _$TobaccoTasteDtoToJson(TobaccoTasteDto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('CzName', instance.czName);
  writeNotNull('EngName', instance.engName);
  writeNotNull('Id', instance.id);
  writeNotNull('OriginalName', instance.originalName);
  return val;
}
