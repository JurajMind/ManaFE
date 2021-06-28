//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class SeatDto {
  /// Returns a new [SeatDto] instance.
  SeatDto({
    this.id,
    this.name,
    this.code,
    this.capacity,
  });

  int id;

  String name;

  String code;

  int capacity;

  @override
  bool operator ==(Object other) => identical(this, other) || other is SeatDto &&
     other.id == id &&
     other.name == name &&
     other.code == code &&
     other.capacity == capacity;

  @override
  int get hashCode =>
    (id == null ? 0 : id.hashCode) +
    (name == null ? 0 : name.hashCode) +
    (code == null ? 0 : code.hashCode) +
    (capacity == null ? 0 : capacity.hashCode);

  @override
  String toString() => 'SeatDto[id=$id, name=$name, code=$code, capacity=$capacity]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (id != null) {
      json[r'Id'] = id;
    }
    if (name != null) {
      json[r'Name'] = name;
    }
    if (code != null) {
      json[r'Code'] = code;
    }
    if (capacity != null) {
      json[r'Capacity'] = capacity;
    }
    return json;
  }

  /// Returns a new [SeatDto] instance and imports its values from
  /// [json] if it's non-null, null if [json] is null.
  static SeatDto fromJson(Map<String, dynamic> json) => json == null
    ? null
    : SeatDto(
        id: json[r'Id'],
        name: json[r'Name'],
        code: json[r'Code'],
        capacity: json[r'Capacity'],
    );

  static List<SeatDto> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <SeatDto>[]
      : json.map((v) => SeatDto.fromJson(v)).toList(growable: true == growable);

  static Map<String, SeatDto> mapFromJson(Map<String, dynamic> json) {
    final map = <String, SeatDto>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) => map[key] = SeatDto.fromJson(v));
    }
    return map;
  }

  // maps a json object with a list of SeatDto-objects as value to a dart map
  static Map<String, List<SeatDto>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<SeatDto>>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) {
        map[key] = SeatDto.listFromJson(v, emptyIsNull: emptyIsNull, growable: growable);
      });
    }
    return map;
  }
}

