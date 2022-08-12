// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'animations.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Animations _$AnimationsFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Animations',
      json,
      ($checkedConvert) {
        final val = Animations(
          animations: $checkedConvert(
              'Animations',
              (v) => (v as List<dynamic>?)
                  ?.map((e) => SmartHookahHelpersAnimation.fromJson(
                      e as Map<String, dynamic>))
                  .toList()),
          success: $checkedConvert('Success', (v) => v as bool?),
          message: $checkedConvert('Message', (v) => v as String?),
          httpResponseCode:
              $checkedConvert('HttpResponseCode', (v) => v as int?),
        );
        return val;
      },
      fieldKeyMap: const {
        'animations': 'Animations',
        'success': 'Success',
        'message': 'Message',
        'httpResponseCode': 'HttpResponseCode'
      },
    );

Map<String, dynamic> _$AnimationsToJson(Animations instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'Animations', instance.animations?.map((e) => e.toJson()).toList());
  writeNotNull('Success', instance.success);
  writeNotNull('Message', instance.message);
  writeNotNull('HttpResponseCode', instance.httpResponseCode);
  return val;
}
