//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class PipeAccessoryDetailsDto {
  /// Returns a new [PipeAccessoryDetailsDto] instance.
  PipeAccessoryDetailsDto({
    this.usedByPerson,
    this.usedWith = const [],
    this.ownedByPersons,
    this.ownedByPlaces,
  });

  int usedByPerson;

  List<UsedWithDto> usedWith;

  int ownedByPersons;

  int ownedByPlaces;

  @override
  bool operator ==(Object other) => identical(this, other) || other is PipeAccessoryDetailsDto &&
     other.usedByPerson == usedByPerson &&
     other.usedWith == usedWith &&
     other.ownedByPersons == ownedByPersons &&
     other.ownedByPlaces == ownedByPlaces;

  @override
  int get hashCode =>
    (usedByPerson == null ? 0 : usedByPerson.hashCode) +
    (usedWith == null ? 0 : usedWith.hashCode) +
    (ownedByPersons == null ? 0 : ownedByPersons.hashCode) +
    (ownedByPlaces == null ? 0 : ownedByPlaces.hashCode);

  @override
  String toString() => 'PipeAccessoryDetailsDto[usedByPerson=$usedByPerson, usedWith=$usedWith, ownedByPersons=$ownedByPersons, ownedByPlaces=$ownedByPlaces]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (usedByPerson != null) {
      json[r'UsedByPerson'] = usedByPerson;
    }
    if (usedWith != null) {
      json[r'UsedWith'] = usedWith;
    }
    if (ownedByPersons != null) {
      json[r'OwnedByPersons'] = ownedByPersons;
    }
    if (ownedByPlaces != null) {
      json[r'OwnedByPlaces'] = ownedByPlaces;
    }
    return json;
  }

  /// Returns a new [PipeAccessoryDetailsDto] instance and imports its values from
  /// [json] if it's non-null, null if [json] is null.
  static PipeAccessoryDetailsDto fromJson(Map<String, dynamic> json) => json == null
    ? null
    : PipeAccessoryDetailsDto(
        usedByPerson: json[r'UsedByPerson'],
        usedWith: UsedWithDto.listFromJson(json[r'UsedWith']),
        ownedByPersons: json[r'OwnedByPersons'],
        ownedByPlaces: json[r'OwnedByPlaces'],
    );

  static List<PipeAccessoryDetailsDto> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <PipeAccessoryDetailsDto>[]
      : json.map((v) => PipeAccessoryDetailsDto.fromJson(v)).toList(growable: true == growable);

  static Map<String, PipeAccessoryDetailsDto> mapFromJson(Map<String, dynamic> json) {
    final map = <String, PipeAccessoryDetailsDto>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) => map[key] = PipeAccessoryDetailsDto.fromJson(v));
    }
    return map;
  }

  // maps a json object with a list of PipeAccessoryDetailsDto-objects as value to a dart map
  static Map<String, List<PipeAccessoryDetailsDto>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<PipeAccessoryDetailsDto>>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) {
        map[key] = PipeAccessoryDetailsDto.listFromJson(v, emptyIsNull: emptyIsNull, growable: growable);
      });
    }
    return map;
  }
}

