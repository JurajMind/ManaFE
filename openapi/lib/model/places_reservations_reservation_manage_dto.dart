//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class PlacesReservationsReservationManageDto {
  /// Returns a new [PlacesReservationsReservationManageDto] instance.
  PlacesReservationsReservationManageDto({
    this.startTime,
    this.endTime,
    this.timeSlotSize,
    this.date,
    this.tables = const [],
    this.reservations = const [],
  });

  DateTime startTime;

  DateTime endTime;

  int timeSlotSize;

  DateTime date;

  List<SeatDto> tables;

  List<PlacesReservationsReservationDto> reservations;

  @override
  bool operator ==(Object other) => identical(this, other) || other is PlacesReservationsReservationManageDto &&
     other.startTime == startTime &&
     other.endTime == endTime &&
     other.timeSlotSize == timeSlotSize &&
     other.date == date &&
     other.tables == tables &&
     other.reservations == reservations;

  @override
  int get hashCode =>
    (startTime == null ? 0 : startTime.hashCode) +
    (endTime == null ? 0 : endTime.hashCode) +
    (timeSlotSize == null ? 0 : timeSlotSize.hashCode) +
    (date == null ? 0 : date.hashCode) +
    (tables == null ? 0 : tables.hashCode) +
    (reservations == null ? 0 : reservations.hashCode);

  @override
  String toString() => 'PlacesReservationsReservationManageDto[startTime=$startTime, endTime=$endTime, timeSlotSize=$timeSlotSize, date=$date, tables=$tables, reservations=$reservations]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (startTime != null) {
      json[r'startTime'] = startTime.toUtc().toIso8601String();
    }
    if (endTime != null) {
      json[r'endTime'] = endTime.toUtc().toIso8601String();
    }
    if (timeSlotSize != null) {
      json[r'TimeSlotSize'] = timeSlotSize;
    }
    if (date != null) {
      json[r'Date'] = date.toUtc().toIso8601String();
    }
    if (tables != null) {
      json[r'Tables'] = tables;
    }
    if (reservations != null) {
      json[r'Reservations'] = reservations;
    }
    return json;
  }

  /// Returns a new [PlacesReservationsReservationManageDto] instance and imports its values from
  /// [json] if it's non-null, null if [json] is null.
  static PlacesReservationsReservationManageDto fromJson(Map<String, dynamic> json) => json == null
    ? null
    : PlacesReservationsReservationManageDto(
        startTime: json[r'startTime'] == null
          ? null
          : DateTime.parse(json[r'startTime']),
        endTime: json[r'endTime'] == null
          ? null
          : DateTime.parse(json[r'endTime']),
        timeSlotSize: json[r'TimeSlotSize'],
        date: json[r'Date'] == null
          ? null
          : DateTime.parse(json[r'Date']),
        tables: SeatDto.listFromJson(json[r'Tables']),
        reservations: PlacesReservationsReservationDto.listFromJson(json[r'Reservations']),
    );

  static List<PlacesReservationsReservationManageDto> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <PlacesReservationsReservationManageDto>[]
      : json.map((v) => PlacesReservationsReservationManageDto.fromJson(v)).toList(growable: true == growable);

  static Map<String, PlacesReservationsReservationManageDto> mapFromJson(Map<String, dynamic> json) {
    final map = <String, PlacesReservationsReservationManageDto>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) => map[key] = PlacesReservationsReservationManageDto.fromJson(v));
    }
    return map;
  }

  // maps a json object with a list of PlacesReservationsReservationManageDto-objects as value to a dart map
  static Map<String, List<PlacesReservationsReservationManageDto>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<PlacesReservationsReservationManageDto>>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) {
        map[key] = PlacesReservationsReservationManageDto.listFromJson(v, emptyIsNull: emptyIsNull, growable: growable);
      });
    }
    return map;
  }
}

