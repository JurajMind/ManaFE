//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class PlacesPlaceDashboardDto {
  /// Returns a new [PlacesPlaceDashboardDto] instance.
  PlacesPlaceDashboardDto({
    this.placeDevices = const [],
  });

  List<PlacesDevicePlaceDashboardDto> placeDevices;

  @override
  bool operator ==(Object other) => identical(this, other) || other is PlacesPlaceDashboardDto &&
     other.placeDevices == placeDevices;

  @override
  int get hashCode =>
    (placeDevices == null ? 0 : placeDevices.hashCode);

  @override
  String toString() => 'PlacesPlaceDashboardDto[placeDevices=$placeDevices]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (placeDevices != null) {
      json[r'PlaceDevices'] = placeDevices;
    }
    return json;
  }

  /// Returns a new [PlacesPlaceDashboardDto] instance and imports its values from
  /// [json] if it's non-null, null if [json] is null.
  static PlacesPlaceDashboardDto fromJson(Map<String, dynamic> json) => json == null
    ? null
    : PlacesPlaceDashboardDto(
        placeDevices: PlacesDevicePlaceDashboardDto.listFromJson(json[r'PlaceDevices']),
    );

  static List<PlacesPlaceDashboardDto> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <PlacesPlaceDashboardDto>[]
      : json.map((v) => PlacesPlaceDashboardDto.fromJson(v)).toList(growable: true == growable);

  static Map<String, PlacesPlaceDashboardDto> mapFromJson(Map<String, dynamic> json) {
    final map = <String, PlacesPlaceDashboardDto>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) => map[key] = PlacesPlaceDashboardDto.fromJson(v));
    }
    return map;
  }

  // maps a json object with a list of PlacesPlaceDashboardDto-objects as value to a dart map
  static Map<String, List<PlacesPlaceDashboardDto>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<PlacesPlaceDashboardDto>>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) {
        map[key] = PlacesPlaceDashboardDto.listFromJson(v, emptyIsNull: emptyIsNull, growable: growable);
      });
    }
    return map;
  }
}

