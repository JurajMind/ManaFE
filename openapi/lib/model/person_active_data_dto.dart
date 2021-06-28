//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class PersonActiveDataDto {
  /// Returns a new [PersonActiveDataDto] instance.
  PersonActiveDataDto({
    this.devices = const [],
    this.updateInfo,
    this.activeSmokeSessions = const [],
    this.activeReservations = const [],
    this.activeHookahOrders = const [],
    this.gameProfile,
  });

  List<DeviceSimpleDto> devices;

  DeviceUpdateInfoDto updateInfo;

  List<SmokeSessionSimpleDto> activeSmokeSessions;

  List<PlacesReservationsReservationDto> activeReservations;

  List<HookahOrderDto> activeHookahOrders;

  GameProfileSimpleDto gameProfile;

  @override
  bool operator ==(Object other) => identical(this, other) || other is PersonActiveDataDto &&
     other.devices == devices &&
     other.updateInfo == updateInfo &&
     other.activeSmokeSessions == activeSmokeSessions &&
     other.activeReservations == activeReservations &&
     other.activeHookahOrders == activeHookahOrders &&
     other.gameProfile == gameProfile;

  @override
  int get hashCode =>
    (devices == null ? 0 : devices.hashCode) +
    (updateInfo == null ? 0 : updateInfo.hashCode) +
    (activeSmokeSessions == null ? 0 : activeSmokeSessions.hashCode) +
    (activeReservations == null ? 0 : activeReservations.hashCode) +
    (activeHookahOrders == null ? 0 : activeHookahOrders.hashCode) +
    (gameProfile == null ? 0 : gameProfile.hashCode);

  @override
  String toString() => 'PersonActiveDataDto[devices=$devices, updateInfo=$updateInfo, activeSmokeSessions=$activeSmokeSessions, activeReservations=$activeReservations, activeHookahOrders=$activeHookahOrders, gameProfile=$gameProfile]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (devices != null) {
      json[r'Devices'] = devices;
    }
    if (updateInfo != null) {
      json[r'UpdateInfo'] = updateInfo;
    }
    if (activeSmokeSessions != null) {
      json[r'ActiveSmokeSessions'] = activeSmokeSessions;
    }
    if (activeReservations != null) {
      json[r'ActiveReservations'] = activeReservations;
    }
    if (activeHookahOrders != null) {
      json[r'ActiveHookahOrders'] = activeHookahOrders;
    }
    if (gameProfile != null) {
      json[r'GameProfile'] = gameProfile;
    }
    return json;
  }

  /// Returns a new [PersonActiveDataDto] instance and imports its values from
  /// [json] if it's non-null, null if [json] is null.
  static PersonActiveDataDto fromJson(Map<String, dynamic> json) => json == null
    ? null
    : PersonActiveDataDto(
        devices: DeviceSimpleDto.listFromJson(json[r'Devices']),
        updateInfo: DeviceUpdateInfoDto.fromJson(json[r'UpdateInfo']),
        activeSmokeSessions: SmokeSessionSimpleDto.listFromJson(json[r'ActiveSmokeSessions']),
        activeReservations: PlacesReservationsReservationDto.listFromJson(json[r'ActiveReservations']),
        activeHookahOrders: HookahOrderDto.listFromJson(json[r'ActiveHookahOrders']),
        gameProfile: GameProfileSimpleDto.fromJson(json[r'GameProfile']),
    );

  static List<PersonActiveDataDto> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <PersonActiveDataDto>[]
      : json.map((v) => PersonActiveDataDto.fromJson(v)).toList(growable: true == growable);

  static Map<String, PersonActiveDataDto> mapFromJson(Map<String, dynamic> json) {
    final map = <String, PersonActiveDataDto>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) => map[key] = PersonActiveDataDto.fromJson(v));
    }
    return map;
  }

  // maps a json object with a list of PersonActiveDataDto-objects as value to a dart map
  static Map<String, List<PersonActiveDataDto>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<PersonActiveDataDto>>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) {
        map[key] = PersonActiveDataDto.listFromJson(v, emptyIsNull: emptyIsNull, growable: growable);
      });
    }
    return map;
  }
}

