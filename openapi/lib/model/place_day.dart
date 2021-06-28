//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class PlaceDay {
  /// Returns a new [PlaceDay] instance.
  PlaceDay({
    this.id,
    this.placeId,
    this.day,
    this.openHour,
    this.closeHour,
    this.placeEvents = const [],
  });

  int id;

  int placeId;

  DateTime day;

  String openHour;

  String closeHour;

  List<PlaceEvent> placeEvents;

  @override
  bool operator ==(Object other) => identical(this, other) || other is PlaceDay &&
     other.id == id &&
     other.placeId == placeId &&
     other.day == day &&
     other.openHour == openHour &&
     other.closeHour == closeHour &&
     other.placeEvents == placeEvents;

  @override
  int get hashCode =>
    (id == null ? 0 : id.hashCode) +
    (placeId == null ? 0 : placeId.hashCode) +
    (day == null ? 0 : day.hashCode) +
    (openHour == null ? 0 : openHour.hashCode) +
    (closeHour == null ? 0 : closeHour.hashCode) +
    (placeEvents == null ? 0 : placeEvents.hashCode);

  @override
  String toString() => 'PlaceDay[id=$id, placeId=$placeId, day=$day, openHour=$openHour, closeHour=$closeHour, placeEvents=$placeEvents]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (id != null) {
      json[r'Id'] = id;
    }
    if (placeId != null) {
      json[r'PlaceId'] = placeId;
    }
    if (day != null) {
      json[r'Day'] = day.toUtc().toIso8601String();
    }
    if (openHour != null) {
      json[r'OpenHour'] = openHour;
    }
    if (closeHour != null) {
      json[r'CloseHour'] = closeHour;
    }
    if (placeEvents != null) {
      json[r'PlaceEvents'] = placeEvents;
    }
    return json;
  }

  /// Returns a new [PlaceDay] instance and imports its values from
  /// [json] if it's non-null, null if [json] is null.
  static PlaceDay fromJson(Map<String, dynamic> json) => json == null
    ? null
    : PlaceDay(
        id: json[r'Id'],
        placeId: json[r'PlaceId'],
        day: json[r'Day'] == null
          ? null
          : DateTime.parse(json[r'Day']),
        openHour: json[r'OpenHour'],
        closeHour: json[r'CloseHour'],
        placeEvents: PlaceEvent.listFromJson(json[r'PlaceEvents']),
    );

  static List<PlaceDay> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <PlaceDay>[]
      : json.map((v) => PlaceDay.fromJson(v)).toList(growable: true == growable);

  static Map<String, PlaceDay> mapFromJson(Map<String, dynamic> json) {
    final map = <String, PlaceDay>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) => map[key] = PlaceDay.fromJson(v));
    }
    return map;
  }

  // maps a json object with a list of PlaceDay-objects as value to a dart map
  static Map<String, List<PlaceDay>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<PlaceDay>>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) {
        map[key] = PlaceDay.listFromJson(v, emptyIsNull: emptyIsNull, growable: growable);
      });
    }
    return map;
  }
}

