//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class NearbyPlacesDto {
  /// Returns a new [NearbyPlacesDto] instance.
  NearbyPlacesDto({
    this.nearbyPlaces = const [],
    this.success,
    this.message,
    this.httpResponseCode,
  });

  List<PlaceSimpleDto> nearbyPlaces;

  bool success;

  String message;

  int httpResponseCode;

  @override
  bool operator ==(Object other) => identical(this, other) || other is NearbyPlacesDto &&
     other.nearbyPlaces == nearbyPlaces &&
     other.success == success &&
     other.message == message &&
     other.httpResponseCode == httpResponseCode;

  @override
  int get hashCode =>
    (nearbyPlaces == null ? 0 : nearbyPlaces.hashCode) +
    (success == null ? 0 : success.hashCode) +
    (message == null ? 0 : message.hashCode) +
    (httpResponseCode == null ? 0 : httpResponseCode.hashCode);

  @override
  String toString() => 'NearbyPlacesDto[nearbyPlaces=$nearbyPlaces, success=$success, message=$message, httpResponseCode=$httpResponseCode]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (nearbyPlaces != null) {
      json[r'NearbyPlaces'] = nearbyPlaces;
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

  /// Returns a new [NearbyPlacesDto] instance and imports its values from
  /// [json] if it's non-null, null if [json] is null.
  static NearbyPlacesDto fromJson(Map<String, dynamic> json) => json == null
    ? null
    : NearbyPlacesDto(
        nearbyPlaces: PlaceSimpleDto.listFromJson(json[r'NearbyPlaces']),
        success: json[r'Success'],
        message: json[r'Message'],
        httpResponseCode: json[r'HttpResponseCode'],
    );

  static List<NearbyPlacesDto> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <NearbyPlacesDto>[]
      : json.map((v) => NearbyPlacesDto.fromJson(v)).toList(growable: true == growable);

  static Map<String, NearbyPlacesDto> mapFromJson(Map<String, dynamic> json) {
    final map = <String, NearbyPlacesDto>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) => map[key] = NearbyPlacesDto.fromJson(v));
    }
    return map;
  }

  // maps a json object with a list of NearbyPlacesDto-objects as value to a dart map
  static Map<String, List<NearbyPlacesDto>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<NearbyPlacesDto>>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) {
        map[key] = NearbyPlacesDto.listFromJson(v, emptyIsNull: emptyIsNull, growable: growable);
      });
    }
    return map;
  }
}

