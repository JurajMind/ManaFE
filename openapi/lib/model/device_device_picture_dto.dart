//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class DeviceDevicePictureDto {
  /// Returns a new [DeviceDevicePictureDto] instance.
  DeviceDevicePictureDto({
    this.id,
    this.width,
    this.height,
    this.inlinePicture,
  });

  int id;

  int width;

  int height;

  String inlinePicture;

  @override
  bool operator ==(Object other) => identical(this, other) || other is DeviceDevicePictureDto &&
     other.id == id &&
     other.width == width &&
     other.height == height &&
     other.inlinePicture == inlinePicture;

  @override
  int get hashCode =>
    (id == null ? 0 : id.hashCode) +
    (width == null ? 0 : width.hashCode) +
    (height == null ? 0 : height.hashCode) +
    (inlinePicture == null ? 0 : inlinePicture.hashCode);

  @override
  String toString() => 'DeviceDevicePictureDto[id=$id, width=$width, height=$height, inlinePicture=$inlinePicture]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (id != null) {
      json[r'Id'] = id;
    }
    if (width != null) {
      json[r'Width'] = width;
    }
    if (height != null) {
      json[r'Height'] = height;
    }
    if (inlinePicture != null) {
      json[r'InlinePicture'] = inlinePicture;
    }
    return json;
  }

  /// Returns a new [DeviceDevicePictureDto] instance and imports its values from
  /// [json] if it's non-null, null if [json] is null.
  static DeviceDevicePictureDto fromJson(Map<String, dynamic> json) => json == null
    ? null
    : DeviceDevicePictureDto(
        id: json[r'Id'],
        width: json[r'Width'],
        height: json[r'Height'],
        inlinePicture: json[r'InlinePicture'],
    );

  static List<DeviceDevicePictureDto> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <DeviceDevicePictureDto>[]
      : json.map((v) => DeviceDevicePictureDto.fromJson(v)).toList(growable: true == growable);

  static Map<String, DeviceDevicePictureDto> mapFromJson(Map<String, dynamic> json) {
    final map = <String, DeviceDevicePictureDto>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) => map[key] = DeviceDevicePictureDto.fromJson(v));
    }
    return map;
  }

  // maps a json object with a list of DeviceDevicePictureDto-objects as value to a dart map
  static Map<String, List<DeviceDevicePictureDto>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<DeviceDevicePictureDto>>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) {
        map[key] = DeviceDevicePictureDto.listFromJson(v, emptyIsNull: emptyIsNull, growable: growable);
      });
    }
    return map;
  }
}

