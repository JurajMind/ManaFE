// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_event_collection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlaceEventCollection _$PlaceEventCollectionFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'PlaceEventCollection',
      json,
      ($checkedConvert) {
        final val = PlaceEventCollection(
          eventCollection: $checkedConvert(
              'EventCollection',
              (v) => (v as List<dynamic>?)
                  ?.map((e) => PlaceEvent.fromJson(e as Map<String, dynamic>))
                  .toList()),
          success: $checkedConvert('Success', (v) => v as bool?),
          message: $checkedConvert('Message', (v) => v as String?),
          httpResponseCode:
              $checkedConvert('HttpResponseCode', (v) => v as int?),
        );
        return val;
      },
      fieldKeyMap: const {
        'eventCollection': 'EventCollection',
        'success': 'Success',
        'message': 'Message',
        'httpResponseCode': 'HttpResponseCode'
      },
    );

Map<String, dynamic> _$PlaceEventCollectionToJson(
    PlaceEventCollection instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('EventCollection',
      instance.eventCollection?.map((e) => e.toJson()).toList());
  writeNotNull('Success', instance.success);
  writeNotNull('Message', instance.message);
  writeNotNull('HttpResponseCode', instance.httpResponseCode);
  return val;
}
