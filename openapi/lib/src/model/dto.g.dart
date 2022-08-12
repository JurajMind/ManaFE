// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Dto _$DtoFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Dto',
      json,
      ($checkedConvert) {
        final val = Dto(
          success: $checkedConvert('Success', (v) => v as bool?),
          message: $checkedConvert('Message', (v) => v as String?),
          httpResponseCode:
              $checkedConvert('HttpResponseCode', (v) => v as int?),
        );
        return val;
      },
      fieldKeyMap: const {
        'success': 'Success',
        'message': 'Message',
        'httpResponseCode': 'HttpResponseCode'
      },
    );

Map<String, dynamic> _$DtoToJson(Dto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Success', instance.success);
  writeNotNull('Message', instance.message);
  writeNotNull('HttpResponseCode', instance.httpResponseCode);
  return val;
}
