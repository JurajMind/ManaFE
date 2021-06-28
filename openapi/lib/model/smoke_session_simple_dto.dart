//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class SmokeSessionSimpleDto {
  /// Returns a new [SmokeSessionSimpleDto] instance.
  SmokeSessionSimpleDto({
    this.id,
    this.live,
    this.sessionId,
    this.device,
    this.statistic,
    this.metaData,
    this.placeId,
    this.placeName,
  });

  int id;

  bool live;

  String sessionId;

  DeviceSimpleDto device;

  DynamicSmokeStatisticRawDto statistic;

  SmokeSessionMetaDataDto metaData;

  int placeId;

  String placeName;

  @override
  bool operator ==(Object other) => identical(this, other) || other is SmokeSessionSimpleDto &&
     other.id == id &&
     other.live == live &&
     other.sessionId == sessionId &&
     other.device == device &&
     other.statistic == statistic &&
     other.metaData == metaData &&
     other.placeId == placeId &&
     other.placeName == placeName;

  @override
  int get hashCode =>
    (id == null ? 0 : id.hashCode) +
    (live == null ? 0 : live.hashCode) +
    (sessionId == null ? 0 : sessionId.hashCode) +
    (device == null ? 0 : device.hashCode) +
    (statistic == null ? 0 : statistic.hashCode) +
    (metaData == null ? 0 : metaData.hashCode) +
    (placeId == null ? 0 : placeId.hashCode) +
    (placeName == null ? 0 : placeName.hashCode);

  @override
  String toString() => 'SmokeSessionSimpleDto[id=$id, live=$live, sessionId=$sessionId, device=$device, statistic=$statistic, metaData=$metaData, placeId=$placeId, placeName=$placeName]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (id != null) {
      json[r'Id'] = id;
    }
    if (live != null) {
      json[r'Live'] = live;
    }
    if (sessionId != null) {
      json[r'SessionId'] = sessionId;
    }
    if (device != null) {
      json[r'Device'] = device;
    }
    if (statistic != null) {
      json[r'Statistic'] = statistic;
    }
    if (metaData != null) {
      json[r'MetaData'] = metaData;
    }
    if (placeId != null) {
      json[r'PlaceId'] = placeId;
    }
    if (placeName != null) {
      json[r'PlaceName'] = placeName;
    }
    return json;
  }

  /// Returns a new [SmokeSessionSimpleDto] instance and imports its values from
  /// [json] if it's non-null, null if [json] is null.
  static SmokeSessionSimpleDto fromJson(Map<String, dynamic> json) => json == null
    ? null
    : SmokeSessionSimpleDto(
        id: json[r'Id'],
        live: json[r'Live'],
        sessionId: json[r'SessionId'],
        device: DeviceSimpleDto.fromJson(json[r'Device']),
        statistic: DynamicSmokeStatisticRawDto.fromJson(json[r'Statistic']),
        metaData: SmokeSessionMetaDataDto.fromJson(json[r'MetaData']),
        placeId: json[r'PlaceId'],
        placeName: json[r'PlaceName'],
    );

  static List<SmokeSessionSimpleDto> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <SmokeSessionSimpleDto>[]
      : json.map((v) => SmokeSessionSimpleDto.fromJson(v)).toList(growable: true == growable);

  static Map<String, SmokeSessionSimpleDto> mapFromJson(Map<String, dynamic> json) {
    final map = <String, SmokeSessionSimpleDto>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) => map[key] = SmokeSessionSimpleDto.fromJson(v));
    }
    return map;
  }

  // maps a json object with a list of SmokeSessionSimpleDto-objects as value to a dart map
  static Map<String, List<SmokeSessionSimpleDto>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<SmokeSessionSimpleDto>>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) {
        map[key] = SmokeSessionSimpleDto.listFromJson(v, emptyIsNull: emptyIsNull, growable: growable);
      });
    }
    return map;
  }
}

