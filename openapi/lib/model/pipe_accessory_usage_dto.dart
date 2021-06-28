//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class PipeAccessoryUsageDto {
  /// Returns a new [PipeAccessoryUsageDto] instance.
  PipeAccessoryUsageDto({
    this.id,
    this.brandName,
    this.accName,
    this.type,
    this.used,
    this.owned,
    this.inMix,
  });

  int id;

  String brandName;

  String accName;

  String type;

  int used;

  bool owned;

  int inMix;

  @override
  bool operator ==(Object other) => identical(this, other) || other is PipeAccessoryUsageDto &&
     other.id == id &&
     other.brandName == brandName &&
     other.accName == accName &&
     other.type == type &&
     other.used == used &&
     other.owned == owned &&
     other.inMix == inMix;

  @override
  int get hashCode =>
    (id == null ? 0 : id.hashCode) +
    (brandName == null ? 0 : brandName.hashCode) +
    (accName == null ? 0 : accName.hashCode) +
    (type == null ? 0 : type.hashCode) +
    (used == null ? 0 : used.hashCode) +
    (owned == null ? 0 : owned.hashCode) +
    (inMix == null ? 0 : inMix.hashCode);

  @override
  String toString() => 'PipeAccessoryUsageDto[id=$id, brandName=$brandName, accName=$accName, type=$type, used=$used, owned=$owned, inMix=$inMix]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (id != null) {
      json[r'Id'] = id;
    }
    if (brandName != null) {
      json[r'BrandName'] = brandName;
    }
    if (accName != null) {
      json[r'AccName'] = accName;
    }
    if (type != null) {
      json[r'Type'] = type;
    }
    if (used != null) {
      json[r'Used'] = used;
    }
    if (owned != null) {
      json[r'Owned'] = owned;
    }
    if (inMix != null) {
      json[r'InMix'] = inMix;
    }
    return json;
  }

  /// Returns a new [PipeAccessoryUsageDto] instance and imports its values from
  /// [json] if it's non-null, null if [json] is null.
  static PipeAccessoryUsageDto fromJson(Map<String, dynamic> json) => json == null
    ? null
    : PipeAccessoryUsageDto(
        id: json[r'Id'],
        brandName: json[r'BrandName'],
        accName: json[r'AccName'],
        type: json[r'Type'],
        used: json[r'Used'],
        owned: json[r'Owned'],
        inMix: json[r'InMix'],
    );

  static List<PipeAccessoryUsageDto> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <PipeAccessoryUsageDto>[]
      : json.map((v) => PipeAccessoryUsageDto.fromJson(v)).toList(growable: true == growable);

  static Map<String, PipeAccessoryUsageDto> mapFromJson(Map<String, dynamic> json) {
    final map = <String, PipeAccessoryUsageDto>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) => map[key] = PipeAccessoryUsageDto.fromJson(v));
    }
    return map;
  }

  // maps a json object with a list of PipeAccessoryUsageDto-objects as value to a dart map
  static Map<String, List<PipeAccessoryUsageDto>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<PipeAccessoryUsageDto>>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) {
        map[key] = PipeAccessoryUsageDto.listFromJson(v, emptyIsNull: emptyIsNull, growable: growable);
      });
    }
    return map;
  }
}

