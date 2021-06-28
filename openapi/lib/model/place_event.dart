//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class PlaceEvent {
  /// Returns a new [PlaceEvent] instance.
  PlaceEvent({
    this.id,
    this.placeDayId,
    this.title,
    this.description,
    this.start,
    this.end,
    this.privacyType,
    this.facebookUrl,
    this.success,
    this.message,
    this.httpResponseCode,
  });

  int id;

  int placeDayId;

  String title;

  String description;

  DateTime start;

  DateTime end;

  String privacyType;

  String facebookUrl;

  bool success;

  String message;

  int httpResponseCode;

  @override
  bool operator ==(Object other) => identical(this, other) || other is PlaceEvent &&
     other.id == id &&
     other.placeDayId == placeDayId &&
     other.title == title &&
     other.description == description &&
     other.start == start &&
     other.end == end &&
     other.privacyType == privacyType &&
     other.facebookUrl == facebookUrl &&
     other.success == success &&
     other.message == message &&
     other.httpResponseCode == httpResponseCode;

  @override
  int get hashCode =>
    (id == null ? 0 : id.hashCode) +
    (placeDayId == null ? 0 : placeDayId.hashCode) +
    (title == null ? 0 : title.hashCode) +
    (description == null ? 0 : description.hashCode) +
    (start == null ? 0 : start.hashCode) +
    (end == null ? 0 : end.hashCode) +
    (privacyType == null ? 0 : privacyType.hashCode) +
    (facebookUrl == null ? 0 : facebookUrl.hashCode) +
    (success == null ? 0 : success.hashCode) +
    (message == null ? 0 : message.hashCode) +
    (httpResponseCode == null ? 0 : httpResponseCode.hashCode);

  @override
  String toString() => 'PlaceEvent[id=$id, placeDayId=$placeDayId, title=$title, description=$description, start=$start, end=$end, privacyType=$privacyType, facebookUrl=$facebookUrl, success=$success, message=$message, httpResponseCode=$httpResponseCode]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (id != null) {
      json[r'Id'] = id;
    }
    if (placeDayId != null) {
      json[r'PlaceDayId'] = placeDayId;
    }
    if (title != null) {
      json[r'Title'] = title;
    }
    if (description != null) {
      json[r'Description'] = description;
    }
    if (start != null) {
      json[r'Start'] = start.toUtc().toIso8601String();
    }
    if (end != null) {
      json[r'End'] = end.toUtc().toIso8601String();
    }
    if (privacyType != null) {
      json[r'PrivacyType'] = privacyType;
    }
    if (facebookUrl != null) {
      json[r'FacebookUrl'] = facebookUrl;
    }
    if (success != null) {
      json[r'Success'] = success;
    }
    if (message != null) {
      json[r'Message'] = message;
    }
    if (httpResponseCode != null) {
      json[r'HttpResponseCode'] = httpResponseCode;
    }
    return json;
  }

  /// Returns a new [PlaceEvent] instance and imports its values from
  /// [json] if it's non-null, null if [json] is null.
  static PlaceEvent fromJson(Map<String, dynamic> json) => json == null
    ? null
    : PlaceEvent(
        id: json[r'Id'],
        placeDayId: json[r'PlaceDayId'],
        title: json[r'Title'],
        description: json[r'Description'],
        start: json[r'Start'] == null
          ? null
          : DateTime.parse(json[r'Start']),
        end: json[r'End'] == null
          ? null
          : DateTime.parse(json[r'End']),
        privacyType: json[r'PrivacyType'],
        facebookUrl: json[r'FacebookUrl'],
        success: json[r'Success'],
        message: json[r'Message'],
        httpResponseCode: json[r'HttpResponseCode'],
    );

  static List<PlaceEvent> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <PlaceEvent>[]
      : json.map((v) => PlaceEvent.fromJson(v)).toList(growable: true == growable);

  static Map<String, PlaceEvent> mapFromJson(Map<String, dynamic> json) {
    final map = <String, PlaceEvent>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) => map[key] = PlaceEvent.fromJson(v));
    }
    return map;
  }

  // maps a json object with a list of PlaceEvent-objects as value to a dart map
  static Map<String, List<PlaceEvent>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<PlaceEvent>>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) {
        map[key] = PlaceEvent.listFromJson(v, emptyIsNull: emptyIsNull, growable: growable);
      });
    }
    return map;
  }
}

