// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'places_reservations_reservation_detail_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlacesReservationsReservationDetailDto
    _$PlacesReservationsReservationDetailDtoFromJson(
            Map<String, dynamic> json) =>
        $checkedCreate(
          'PlacesReservationsReservationDetailDto',
          json,
          ($checkedConvert) {
            final val = PlacesReservationsReservationDetailDto(
              reservation: $checkedConvert(
                  'Reservation',
                  (v) => v == null
                      ? null
                      : PlacesReservationsReservationDto.fromJson(
                          v as Map<String, dynamic>)),
              place: $checkedConvert(
                  'Place',
                  (v) => v == null
                      ? null
                      : PlaceDto.fromJson(v as Map<String, dynamic>)),
              smokeSessions: $checkedConvert(
                  'SmokeSessions',
                  (v) => (v as List<dynamic>?)
                      ?.map((e) => SmokeSessionSimpleDto.fromJson(
                          e as Map<String, dynamic>))
                      .toList()),
              orders: $checkedConvert(
                  'Orders',
                  (v) => (v as List<dynamic>?)
                      ?.map((e) =>
                          HookahOrderDto.fromJson(e as Map<String, dynamic>))
                      .toList()),
            );
            return val;
          },
          fieldKeyMap: const {
            'reservation': 'Reservation',
            'place': 'Place',
            'smokeSessions': 'SmokeSessions',
            'orders': 'Orders'
          },
        );

Map<String, dynamic> _$PlacesReservationsReservationDetailDtoToJson(
    PlacesReservationsReservationDetailDto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Reservation', instance.reservation?.toJson());
  writeNotNull('Place', instance.place?.toJson());
  writeNotNull(
      'SmokeSessions', instance.smokeSessions?.map((e) => e.toJson()).toList());
  writeNotNull('Orders', instance.orders?.map((e) => e.toJson()).toList());
  return val;
}
