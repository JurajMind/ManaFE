// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlaceEvent _$PlaceEventFromJson(Map<String, dynamic> json) => $checkedCreate(
      'PlaceEvent',
      json,
      ($checkedConvert) {
        final val = PlaceEvent(
          id: $checkedConvert('Id', (v) => v as int?),
          placeDayId: $checkedConvert('PlaceDayId', (v) => v as int?),
          title: $checkedConvert('Title', (v) => v as String?),
          description: $checkedConvert('Description', (v) => v as String?),
          start: $checkedConvert(
              'Start', (v) => v == null ? null : DateTime.parse(v as String)),
          end: $checkedConvert(
              'End', (v) => v == null ? null : DateTime.parse(v as String)),
          privacyType: $checkedConvert('PrivacyType', (v) => v as String?),
          facebookUrl: $checkedConvert('FacebookUrl', (v) => v as String?),
          success: $checkedConvert('Success', (v) => v as bool?),
          message: $checkedConvert('Message', (v) => v as String?),
          httpResponseCode:
              $checkedConvert('HttpResponseCode', (v) => v as int?),
        );
        return val;
      },
      fieldKeyMap: const {
        'id': 'Id',
        'placeDayId': 'PlaceDayId',
        'title': 'Title',
        'description': 'Description',
        'start': 'Start',
        'end': 'End',
        'privacyType': 'PrivacyType',
        'facebookUrl': 'FacebookUrl',
        'success': 'Success',
        'message': 'Message',
        'httpResponseCode': 'HttpResponseCode'
      },
    );

Map<String, dynamic> _$PlaceEventToJson(PlaceEvent instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Id', instance.id);
  writeNotNull('PlaceDayId', instance.placeDayId);
  writeNotNull('Title', instance.title);
  writeNotNull('Description', instance.description);
  writeNotNull('Start', instance.start?.toIso8601String());
  writeNotNull('End', instance.end?.toIso8601String());
  writeNotNull('PrivacyType', instance.privacyType);
  writeNotNull('FacebookUrl', instance.facebookUrl);
  writeNotNull('Success', instance.success);
  writeNotNull('Message', instance.message);
  writeNotNull('HttpResponseCode', instance.httpResponseCode);
  return val;
}
