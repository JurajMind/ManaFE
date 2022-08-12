// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'places_reservations_reservation_manage_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlacesReservationsReservationManageDto
    _$PlacesReservationsReservationManageDtoFromJson(
            Map<String, dynamic> json) =>
        $checkedCreate(
          'PlacesReservationsReservationManageDto',
          json,
          ($checkedConvert) {
            final val = PlacesReservationsReservationManageDto(
              startTime: $checkedConvert('startTime',
                  (v) => v == null ? null : DateTime.parse(v as String)),
              endTime: $checkedConvert('endTime',
                  (v) => v == null ? null : DateTime.parse(v as String)),
              timeSlotSize: $checkedConvert('TimeSlotSize', (v) => v as int?),
              date: $checkedConvert('Date',
                  (v) => v == null ? null : DateTime.parse(v as String)),
              tables: $checkedConvert(
                  'Tables',
                  (v) => (v as List<dynamic>?)
                      ?.map((e) => SeatDto.fromJson(e as Map<String, dynamic>))
                      .toList()),
              reservations: $checkedConvert(
                  'Reservations',
                  (v) => (v as List<dynamic>?)
                      ?.map((e) => PlacesReservationsReservationDto.fromJson(
                          e as Map<String, dynamic>))
                      .toList()),
            );
            return val;
          },
          fieldKeyMap: const {
            'timeSlotSize': 'TimeSlotSize',
            'date': 'Date',
            'tables': 'Tables',
            'reservations': 'Reservations'
          },
        );

Map<String, dynamic> _$PlacesReservationsReservationManageDtoToJson(
    PlacesReservationsReservationManageDto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('startTime', instance.startTime?.toIso8601String());
  writeNotNull('endTime', instance.endTime?.toIso8601String());
  writeNotNull('TimeSlotSize', instance.timeSlotSize);
  writeNotNull('Date', instance.date?.toIso8601String());
  writeNotNull('Tables', instance.tables?.map((e) => e.toJson()).toList());
  writeNotNull(
      'Reservations', instance.reservations?.map((e) => e.toJson()).toList());
  return val;
}
