// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_day.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlaceDay _$PlaceDayFromJson(Map<String, dynamic> json) => $checkedCreate(
      'PlaceDay',
      json,
      ($checkedConvert) {
        final val = PlaceDay(
          id: $checkedConvert('Id', (v) => v as int?),
          placeId: $checkedConvert('PlaceId', (v) => v as int?),
          day: $checkedConvert(
              'Day', (v) => v == null ? null : DateTime.parse(v as String)),
          openHour: $checkedConvert('OpenHour', (v) => v as String?),
          closeHour: $checkedConvert('CloseHour', (v) => v as String?),
          placeEvents: $checkedConvert(
              'PlaceEvents',
              (v) => (v as List<dynamic>?)
                  ?.map((e) => PlaceEvent.fromJson(e as Map<String, dynamic>))
                  .toList()),
        );
        return val;
      },
      fieldKeyMap: const {
        'id': 'Id',
        'placeId': 'PlaceId',
        'day': 'Day',
        'openHour': 'OpenHour',
        'closeHour': 'CloseHour',
        'placeEvents': 'PlaceEvents'
      },
    );

Map<String, dynamic> _$PlaceDayToJson(PlaceDay instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Id', instance.id);
  writeNotNull('PlaceId', instance.placeId);
  writeNotNull('Day', instance.day?.toIso8601String());
  writeNotNull('OpenHour', instance.openHour);
  writeNotNull('CloseHour', instance.closeHour);
  writeNotNull(
      'PlaceEvents', instance.placeEvents?.map((e) => e.toJson()).toList());
  return val;
}
