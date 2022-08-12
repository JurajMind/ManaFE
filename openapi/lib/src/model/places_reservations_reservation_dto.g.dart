// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'places_reservations_reservation_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlacesReservationsReservationDto _$PlacesReservationsReservationDtoFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'PlacesReservationsReservationDto',
      json,
      ($checkedConvert) {
        final val = PlacesReservationsReservationDto(
          id: $checkedConvert('Id', (v) => v as int?),
          created: $checkedConvert(
              'Created', (v) => v == null ? null : DateTime.parse(v as String)),
          personId: $checkedConvert('PersonId', (v) => v as int?),
          placeId: $checkedConvert('PlaceId', (v) => v as int?),
          placeName: $checkedConvert('PlaceName', (v) => v as String?),
          started: $checkedConvert(
              'Started', (v) => v == null ? null : DateTime.parse(v as String)),
          end: $checkedConvert(
              'End', (v) => v == null ? null : DateTime.parse(v as String)),
          persons: $checkedConvert('Persons', (v) => v as int?),
          duration: $checkedConvert('Duration', (v) => v as String?),
          time: $checkedConvert(
              'Time', (v) => v == null ? null : DateTime.parse(v as String)),
          text: $checkedConvert('Text', (v) => v as String?),
          name: $checkedConvert('Name', (v) => v as String?),
          displayName: $checkedConvert('DisplayName', (v) => v as String?),
          status: $checkedConvert('Status', (v) => v as int?),
          seats: $checkedConvert('Seats',
              (v) => (v as List<dynamic>?)?.map((e) => e as int).toList()),
          lateDuration: $checkedConvert('LateDuration', (v) => v as int?),
        );
        return val;
      },
      fieldKeyMap: const {
        'id': 'Id',
        'created': 'Created',
        'personId': 'PersonId',
        'placeId': 'PlaceId',
        'placeName': 'PlaceName',
        'started': 'Started',
        'end': 'End',
        'persons': 'Persons',
        'duration': 'Duration',
        'time': 'Time',
        'text': 'Text',
        'name': 'Name',
        'displayName': 'DisplayName',
        'status': 'Status',
        'seats': 'Seats',
        'lateDuration': 'LateDuration'
      },
    );

Map<String, dynamic> _$PlacesReservationsReservationDtoToJson(
    PlacesReservationsReservationDto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Id', instance.id);
  writeNotNull('Created', instance.created?.toIso8601String());
  writeNotNull('PersonId', instance.personId);
  writeNotNull('PlaceId', instance.placeId);
  writeNotNull('PlaceName', instance.placeName);
  writeNotNull('Started', instance.started?.toIso8601String());
  writeNotNull('End', instance.end?.toIso8601String());
  writeNotNull('Persons', instance.persons);
  writeNotNull('Duration', instance.duration);
  writeNotNull('Time', instance.time?.toIso8601String());
  writeNotNull('Text', instance.text);
  writeNotNull('Name', instance.name);
  writeNotNull('DisplayName', instance.displayName);
  writeNotNull('Status', instance.status);
  writeNotNull('Seats', instance.seats);
  writeNotNull('LateDuration', instance.lateDuration);
  return val;
}
