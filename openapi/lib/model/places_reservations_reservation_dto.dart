//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class PlacesReservationsReservationDto {
  /// Returns a new [PlacesReservationsReservationDto] instance.
  PlacesReservationsReservationDto({
    this.id,
    this.created,
    this.personId,
    this.placeId,
    this.placeName,
    this.started,
    this.end,
    this.persons,
    this.duration,
    this.time,
    this.text,
    this.name,
    this.displayName,
    this.status,
    this.seats = const [],
    this.lateDuration,
  });

  int id;

  DateTime created;

  int personId;

  int placeId;

  String placeName;

  DateTime started;

  DateTime end;

  int persons;

  String duration;

  DateTime time;

  String text;

  String name;

  String displayName;

  int status;

  List<int> seats;

  int lateDuration;

  @override
  bool operator ==(Object other) => identical(this, other) || other is PlacesReservationsReservationDto &&
     other.id == id &&
     other.created == created &&
     other.personId == personId &&
     other.placeId == placeId &&
     other.placeName == placeName &&
     other.started == started &&
     other.end == end &&
     other.persons == persons &&
     other.duration == duration &&
     other.time == time &&
     other.text == text &&
     other.name == name &&
     other.displayName == displayName &&
     other.status == status &&
     other.seats == seats &&
     other.lateDuration == lateDuration;

  @override
  int get hashCode =>
    (id == null ? 0 : id.hashCode) +
    (created == null ? 0 : created.hashCode) +
    (personId == null ? 0 : personId.hashCode) +
    (placeId == null ? 0 : placeId.hashCode) +
    (placeName == null ? 0 : placeName.hashCode) +
    (started == null ? 0 : started.hashCode) +
    (end == null ? 0 : end.hashCode) +
    (persons == null ? 0 : persons.hashCode) +
    (duration == null ? 0 : duration.hashCode) +
    (time == null ? 0 : time.hashCode) +
    (text == null ? 0 : text.hashCode) +
    (name == null ? 0 : name.hashCode) +
    (displayName == null ? 0 : displayName.hashCode) +
    (status == null ? 0 : status.hashCode) +
    (seats == null ? 0 : seats.hashCode) +
    (lateDuration == null ? 0 : lateDuration.hashCode);

  @override
  String toString() => 'PlacesReservationsReservationDto[id=$id, created=$created, personId=$personId, placeId=$placeId, placeName=$placeName, started=$started, end=$end, persons=$persons, duration=$duration, time=$time, text=$text, name=$name, displayName=$displayName, status=$status, seats=$seats, lateDuration=$lateDuration]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (id != null) {
      json[r'Id'] = id;
    }
    if (created != null) {
      json[r'Created'] = created.toUtc().toIso8601String();
    }
    if (personId != null) {
      json[r'PersonId'] = personId;
    }
    if (placeId != null) {
      json[r'PlaceId'] = placeId;
    }
    if (placeName != null) {
      json[r'PlaceName'] = placeName;
    }
    if (started != null) {
      json[r'Started'] = started.toUtc().toIso8601String();
    }
    if (end != null) {
      json[r'End'] = end.toUtc().toIso8601String();
    }
    if (persons != null) {
      json[r'Persons'] = persons;
    }
    if (duration != null) {
      json[r'Duration'] = duration;
    }
    if (time != null) {
      json[r'Time'] = time.toUtc().toIso8601String();
    }
    if (text != null) {
      json[r'Text'] = text;
    }
    if (name != null) {
      json[r'Name'] = name;
    }
    if (displayName != null) {
      json[r'DisplayName'] = displayName;
    }
    if (status != null) {
      json[r'Status'] = status;
    }
    if (seats != null) {
      json[r'Seats'] = seats;
    }
    if (lateDuration != null) {
      json[r'LateDuration'] = lateDuration;
    }
    return json;
  }

  /// Returns a new [PlacesReservationsReservationDto] instance and imports its values from
  /// [json] if it's non-null, null if [json] is null.
  static PlacesReservationsReservationDto fromJson(Map<String, dynamic> json) => json == null
    ? null
    : PlacesReservationsReservationDto(
        id: json[r'Id'],
        created: json[r'Created'] == null
          ? null
          : DateTime.parse(json[r'Created']),
        personId: json[r'PersonId'],
        placeId: json[r'PlaceId'],
        placeName: json[r'PlaceName'],
        started: json[r'Started'] == null
          ? null
          : DateTime.parse(json[r'Started']),
        end: json[r'End'] == null
          ? null
          : DateTime.parse(json[r'End']),
        persons: json[r'Persons'],
        duration: json[r'Duration'],
        time: json[r'Time'] == null
          ? null
          : DateTime.parse(json[r'Time']),
        text: json[r'Text'],
        name: json[r'Name'],
        displayName: json[r'DisplayName'],
        status: json[r'Status'],
        seats: json[r'Seats'] == null
          ? null
          : (json[r'Seats'] as List).cast<int>(),
        lateDuration: json[r'LateDuration'],
    );

  static List<PlacesReservationsReservationDto> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <PlacesReservationsReservationDto>[]
      : json.map((v) => PlacesReservationsReservationDto.fromJson(v)).toList(growable: true == growable);

  static Map<String, PlacesReservationsReservationDto> mapFromJson(Map<String, dynamic> json) {
    final map = <String, PlacesReservationsReservationDto>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) => map[key] = PlacesReservationsReservationDto.fromJson(v));
    }
    return map;
  }

  // maps a json object with a list of PlacesReservationsReservationDto-objects as value to a dart map
  static Map<String, List<PlacesReservationsReservationDto>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<PlacesReservationsReservationDto>>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) {
        map[key] = PlacesReservationsReservationDto.listFromJson(v, emptyIsNull: emptyIsNull, growable: growable);
      });
    }
    return map;
  }
}

