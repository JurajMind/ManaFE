//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class SmartHookahServicesPlaceReservationUsageDto {
  /// Returns a new [SmartHookahServicesPlaceReservationUsageDto] instance.
  SmartHookahServicesPlaceReservationUsageDto({
    this.timeSlots = const [],
  });

  List<ReservationsTimeSlot> timeSlots;

  @override
  bool operator ==(Object other) => identical(this, other) || other is SmartHookahServicesPlaceReservationUsageDto &&
     other.timeSlots == timeSlots;

  @override
  int get hashCode =>
    (timeSlots == null ? 0 : timeSlots.hashCode);

  @override
  String toString() => 'SmartHookahServicesPlaceReservationUsageDto[timeSlots=$timeSlots]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (timeSlots != null) {
      json[r'TimeSlots'] = timeSlots;
    }
    return json;
  }

  /// Returns a new [SmartHookahServicesPlaceReservationUsageDto] instance and imports its values from
  /// [json] if it's non-null, null if [json] is null.
  static SmartHookahServicesPlaceReservationUsageDto fromJson(Map<String, dynamic> json) => json == null
    ? null
    : SmartHookahServicesPlaceReservationUsageDto(
        timeSlots: ReservationsTimeSlot.listFromJson(json[r'TimeSlots']),
    );

  static List<SmartHookahServicesPlaceReservationUsageDto> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <SmartHookahServicesPlaceReservationUsageDto>[]
      : json.map((v) => SmartHookahServicesPlaceReservationUsageDto.fromJson(v)).toList(growable: true == growable);

  static Map<String, SmartHookahServicesPlaceReservationUsageDto> mapFromJson(Map<String, dynamic> json) {
    final map = <String, SmartHookahServicesPlaceReservationUsageDto>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) => map[key] = SmartHookahServicesPlaceReservationUsageDto.fromJson(v));
    }
    return map;
  }

  // maps a json object with a list of SmartHookahServicesPlaceReservationUsageDto-objects as value to a dart map
  static Map<String, List<SmartHookahServicesPlaceReservationUsageDto>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<SmartHookahServicesPlaceReservationUsageDto>>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) {
        map[key] = SmartHookahServicesPlaceReservationUsageDto.listFromJson(v, emptyIsNull: emptyIsNull, growable: growable);
      });
    }
    return map;
  }
}

