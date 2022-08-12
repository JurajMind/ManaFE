// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'smart_hookah_services_place_reservation_usage_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SmartHookahServicesPlaceReservationUsageDto
    _$SmartHookahServicesPlaceReservationUsageDtoFromJson(
            Map<String, dynamic> json) =>
        $checkedCreate(
          'SmartHookahServicesPlaceReservationUsageDto',
          json,
          ($checkedConvert) {
            final val = SmartHookahServicesPlaceReservationUsageDto(
              timeSlots: $checkedConvert(
                  'TimeSlots',
                  (v) => (v as List<dynamic>?)
                      ?.map((e) => ReservationsTimeSlot.fromJson(
                          e as Map<String, dynamic>))
                      .toList()),
            );
            return val;
          },
          fieldKeyMap: const {'timeSlots': 'TimeSlots'},
        );

Map<String, dynamic> _$SmartHookahServicesPlaceReservationUsageDtoToJson(
    SmartHookahServicesPlaceReservationUsageDto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'TimeSlots', instance.timeSlots?.map((e) => e.toJson()).toList());
  return val;
}
