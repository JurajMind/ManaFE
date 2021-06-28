//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class SmartHookahControllersApiDeviceInfoResponse {
  /// Returns a new [SmartHookahControllersApiDeviceInfoResponse] instance.
  SmartHookahControllersApiDeviceInfoResponse({
    this.picture,
  });

  DeviceDevicePictureDto picture;

  @override
  bool operator ==(Object other) => identical(this, other) || other is SmartHookahControllersApiDeviceInfoResponse &&
     other.picture == picture;

  @override
  int get hashCode =>
    (picture == null ? 0 : picture.hashCode);

  @override
  String toString() => 'SmartHookahControllersApiDeviceInfoResponse[picture=$picture]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (picture != null) {
      json[r'Picture'] = picture;
    }
    return json;
  }

  /// Returns a new [SmartHookahControllersApiDeviceInfoResponse] instance and imports its values from
  /// [json] if it's non-null, null if [json] is null.
  static SmartHookahControllersApiDeviceInfoResponse fromJson(Map<String, dynamic> json) => json == null
    ? null
    : SmartHookahControllersApiDeviceInfoResponse(
        picture: DeviceDevicePictureDto.fromJson(json[r'Picture']),
    );

  static List<SmartHookahControllersApiDeviceInfoResponse> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <SmartHookahControllersApiDeviceInfoResponse>[]
      : json.map((v) => SmartHookahControllersApiDeviceInfoResponse.fromJson(v)).toList(growable: true == growable);

  static Map<String, SmartHookahControllersApiDeviceInfoResponse> mapFromJson(Map<String, dynamic> json) {
    final map = <String, SmartHookahControllersApiDeviceInfoResponse>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) => map[key] = SmartHookahControllersApiDeviceInfoResponse.fromJson(v));
    }
    return map;
  }

  // maps a json object with a list of SmartHookahControllersApiDeviceInfoResponse-objects as value to a dart map
  static Map<String, List<SmartHookahControllersApiDeviceInfoResponse>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<SmartHookahControllersApiDeviceInfoResponse>>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) {
        map[key] = SmartHookahControllersApiDeviceInfoResponse.listFromJson(v, emptyIsNull: emptyIsNull, growable: growable);
      });
    }
    return map;
  }
}

