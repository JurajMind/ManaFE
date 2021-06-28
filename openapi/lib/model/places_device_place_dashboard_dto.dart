//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class PlacesDevicePlaceDashboardDto {
  /// Returns a new [PlacesDevicePlaceDashboardDto] instance.
  PlacesDevicePlaceDashboardDto({
    this.device,
    this.statistic,
    this.metaData,
    this.tobaccoEstimate,
  });

  DeviceSimpleDto device;

  DynamicSmokeStatisticRawDto statistic;

  SmokeSessionMetaDataDto metaData;

  double tobaccoEstimate;

  @override
  bool operator ==(Object other) => identical(this, other) || other is PlacesDevicePlaceDashboardDto &&
     other.device == device &&
     other.statistic == statistic &&
     other.metaData == metaData &&
     other.tobaccoEstimate == tobaccoEstimate;

  @override
  int get hashCode =>
    (device == null ? 0 : device.hashCode) +
    (statistic == null ? 0 : statistic.hashCode) +
    (metaData == null ? 0 : metaData.hashCode) +
    (tobaccoEstimate == null ? 0 : tobaccoEstimate.hashCode);

  @override
  String toString() => 'PlacesDevicePlaceDashboardDto[device=$device, statistic=$statistic, metaData=$metaData, tobaccoEstimate=$tobaccoEstimate]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (device != null) {
      json[r'Device'] = device;
    }
    if (statistic != null) {
      json[r'Statistic'] = statistic;
    }
    if (metaData != null) {
      json[r'MetaData'] = metaData;
    }
    if (tobaccoEstimate != null) {
      json[r'TobaccoEstimate'] = tobaccoEstimate;
    }
    return json;
  }

  /// Returns a new [PlacesDevicePlaceDashboardDto] instance and imports its values from
  /// [json] if it's non-null, null if [json] is null.
  static PlacesDevicePlaceDashboardDto fromJson(Map<String, dynamic> json) => json == null
    ? null
    : PlacesDevicePlaceDashboardDto(
        device: DeviceSimpleDto.fromJson(json[r'Device']),
        statistic: DynamicSmokeStatisticRawDto.fromJson(json[r'Statistic']),
        metaData: SmokeSessionMetaDataDto.fromJson(json[r'MetaData']),
        tobaccoEstimate: json[r'TobaccoEstimate'],
    );

  static List<PlacesDevicePlaceDashboardDto> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <PlacesDevicePlaceDashboardDto>[]
      : json.map((v) => PlacesDevicePlaceDashboardDto.fromJson(v)).toList(growable: true == growable);

  static Map<String, PlacesDevicePlaceDashboardDto> mapFromJson(Map<String, dynamic> json) {
    final map = <String, PlacesDevicePlaceDashboardDto>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) => map[key] = PlacesDevicePlaceDashboardDto.fromJson(v));
    }
    return map;
  }

  // maps a json object with a list of PlacesDevicePlaceDashboardDto-objects as value to a dart map
  static Map<String, List<PlacesDevicePlaceDashboardDto>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<PlacesDevicePlaceDashboardDto>>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) {
        map[key] = PlacesDevicePlaceDashboardDto.listFromJson(v, emptyIsNull: emptyIsNull, growable: growable);
      });
    }
    return map;
  }
}

