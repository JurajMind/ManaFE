//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class PlaceEventCollection {
  /// Returns a new [PlaceEventCollection] instance.
  PlaceEventList.from({
    this.eventCollection = const [],
    this.success,
    this.message,
    this.httpResponseCode,
  });

  List<PlaceEvent> eventCollection;

  bool success;

  String message;

  int httpResponseCode;

  @override
  bool operator ==(Object other) => identical(this, other) || other is PlaceEventCollection &&
     other.eventCollection == eventCollection &&
     other.success == success &&
     other.message == message &&
     other.httpResponseCode == httpResponseCode;

  @override
  int get hashCode =>
    (eventCollection == null ? 0 : eventCollection.hashCode) +
    (success == null ? 0 : success.hashCode) +
    (message == null ? 0 : message.hashCode) +
    (httpResponseCode == null ? 0 : httpResponseCode.hashCode);

  @override
  String toString() => 'PlaceEventCollection[eventCollection=$eventCollection, success=$success, message=$message, httpResponseCode=$httpResponseCode]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (eventCollection != null) {
      json[r'EventCollection'] = eventCollection;
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

  /// Returns a new [PlaceEventCollection] instance and imports its values from
  /// [json] if it's non-null, null if [json] is null.
  static PlaceEventCollection fromJson(Map<String, dynamic> json) => json == null
    ? null
    : PlaceEventList.from(
        eventCollection: PlaceEvent.listFromJson(json[r'EventCollection']),
        success: json[r'Success'],
        message: json[r'Message'],
        httpResponseCode: json[r'HttpResponseCode'],
    );

  static List<PlaceEventCollection> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <PlaceEventCollection>[]
      : json.map((v) => PlaceEventCollection.fromJson(v)).toList(growable: true == growable);

  static Map<String, PlaceEventCollection> mapFromJson(Map<String, dynamic> json) {
    final map = <String, PlaceEventCollection>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) => map[key] = PlaceEventCollection.fromJson(v));
    }
    return map;
  }

  // maps a json object with a list of PlaceEventCollection-objects as value to a dart map
  static Map<String, List<PlaceEventCollection>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<PlaceEventCollection>>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) {
        map[key] = PlaceEventCollection.listFromJson(v, emptyIsNull: emptyIsNull, growable: growable);
      });
    }
    return map;
  }
}

