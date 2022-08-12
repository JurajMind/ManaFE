// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'validation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Validation _$ValidationFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Validation',
      json,
      ($checkedConvert) {
        final val = Validation(
          id: $checkedConvert('Id', (v) => v as String?),
          flag: $checkedConvert('Flag',
              (v) => $enumDecodeNullable(_$ValidationFlagEnumEnumMap, v)),
          success: $checkedConvert('Success', (v) => v as bool?),
          message: $checkedConvert('Message', (v) => v as String?),
          httpResponseCode:
              $checkedConvert('HttpResponseCode', (v) => v as int?),
        );
        return val;
      },
      fieldKeyMap: const {
        'id': 'Id',
        'flag': 'Flag',
        'success': 'Success',
        'message': 'Message',
        'httpResponseCode': 'HttpResponseCode'
      },
    );

Map<String, dynamic> _$ValidationToJson(Validation instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Id', instance.id);
  writeNotNull('Flag', _$ValidationFlagEnumEnumMap[instance.flag]);
  writeNotNull('Success', instance.success);
  writeNotNull('Message', instance.message);
  writeNotNull('HttpResponseCode', instance.httpResponseCode);
  return val;
}

const _$ValidationFlagEnumEnumMap = {
  ValidationFlagEnum.number0: 0,
  ValidationFlagEnum.number1: 1,
};
