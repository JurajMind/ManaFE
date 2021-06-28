//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class PlacesReservationsReservationDetailDto {
  /// Returns a new [PlacesReservationsReservationDetailDto] instance.
  PlacesReservationsReservationDetailDto({
    this.reservation,
    this.place,
    this.smokeSessions = const [],
    this.orders = const [],
  });

  PlacesReservationsReservationDto reservation;

  PlaceDto place;

  List<SmokeSessionSimpleDto> smokeSessions;

  List<HookahOrderDto> orders;

  @override
  bool operator ==(Object other) => identical(this, other) || other is PlacesReservationsReservationDetailDto &&
     other.reservation == reservation &&
     other.place == place &&
     other.smokeSessions == smokeSessions &&
     other.orders == orders;

  @override
  int get hashCode =>
    (reservation == null ? 0 : reservation.hashCode) +
    (place == null ? 0 : place.hashCode) +
    (smokeSessions == null ? 0 : smokeSessions.hashCode) +
    (orders == null ? 0 : orders.hashCode);

  @override
  String toString() => 'PlacesReservationsReservationDetailDto[reservation=$reservation, place=$place, smokeSessions=$smokeSessions, orders=$orders]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (reservation != null) {
      json[r'Reservation'] = reservation;
    }
    if (place != null) {
      json[r'Place'] = place;
    }
    if (smokeSessions != null) {
      json[r'SmokeSessions'] = smokeSessions;
    }
    if (orders != null) {
      json[r'Orders'] = orders;
    }
    return json;
  }

  /// Returns a new [PlacesReservationsReservationDetailDto] instance and imports its values from
  /// [json] if it's non-null, null if [json] is null.
  static PlacesReservationsReservationDetailDto fromJson(Map<String, dynamic> json) => json == null
    ? null
    : PlacesReservationsReservationDetailDto(
        reservation: PlacesReservationsReservationDto.fromJson(json[r'Reservation']),
        place: PlaceDto.fromJson(json[r'Place']),
        smokeSessions: SmokeSessionSimpleDto.listFromJson(json[r'SmokeSessions']),
        orders: HookahOrderDto.listFromJson(json[r'Orders']),
    );

  static List<PlacesReservationsReservationDetailDto> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <PlacesReservationsReservationDetailDto>[]
      : json.map((v) => PlacesReservationsReservationDetailDto.fromJson(v)).toList(growable: true == growable);

  static Map<String, PlacesReservationsReservationDetailDto> mapFromJson(Map<String, dynamic> json) {
    final map = <String, PlacesReservationsReservationDetailDto>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) => map[key] = PlacesReservationsReservationDetailDto.fromJson(v));
    }
    return map;
  }

  // maps a json object with a list of PlacesReservationsReservationDetailDto-objects as value to a dart map
  static Map<String, List<PlacesReservationsReservationDetailDto>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<PlacesReservationsReservationDetailDto>>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) {
        map[key] = PlacesReservationsReservationDetailDto.listFromJson(v, emptyIsNull: emptyIsNull, growable: growable);
      });
    }
    return map;
  }
}

