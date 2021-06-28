//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class PipeAccesoryLikeDto {
  /// Returns a new [PipeAccesoryLikeDto] instance.
  PipeAccesoryLikeDto({
    this.id,
    this.personId,
    this.pipeAccessoryId,
    this.value,
  });

  int id;

  int personId;

  int pipeAccessoryId;

  int value;

  @override
  bool operator ==(Object other) => identical(this, other) || other is PipeAccesoryLikeDto &&
     other.id == id &&
     other.personId == personId &&
     other.pipeAccessoryId == pipeAccessoryId &&
     other.value == value;

  @override
  int get hashCode =>
    (id == null ? 0 : id.hashCode) +
    (personId == null ? 0 : personId.hashCode) +
    (pipeAccessoryId == null ? 0 : pipeAccessoryId.hashCode) +
    (value == null ? 0 : value.hashCode);

  @override
  String toString() => 'PipeAccesoryLikeDto[id=$id, personId=$personId, pipeAccessoryId=$pipeAccessoryId, value=$value]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (id != null) {
      json[r'Id'] = id;
    }
    if (personId != null) {
      json[r'PersonId'] = personId;
    }
    if (pipeAccessoryId != null) {
      json[r'PipeAccessoryId'] = pipeAccessoryId;
    }
    if (value != null) {
      json[r'Value'] = value;
    }
    return json;
  }

  /// Returns a new [PipeAccesoryLikeDto] instance and imports its values from
  /// [json] if it's non-null, null if [json] is null.
  static PipeAccesoryLikeDto fromJson(Map<String, dynamic> json) => json == null
    ? null
    : PipeAccesoryLikeDto(
        id: json[r'Id'],
        personId: json[r'PersonId'],
        pipeAccessoryId: json[r'PipeAccessoryId'],
        value: json[r'Value'],
    );

  static List<PipeAccesoryLikeDto> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <PipeAccesoryLikeDto>[]
      : json.map((v) => PipeAccesoryLikeDto.fromJson(v)).toList(growable: true == growable);

  static Map<String, PipeAccesoryLikeDto> mapFromJson(Map<String, dynamic> json) {
    final map = <String, PipeAccesoryLikeDto>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) => map[key] = PipeAccesoryLikeDto.fromJson(v));
    }
    return map;
  }

  // maps a json object with a list of PipeAccesoryLikeDto-objects as value to a dart map
  static Map<String, List<PipeAccesoryLikeDto>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<PipeAccesoryLikeDto>>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) {
        map[key] = PipeAccesoryLikeDto.listFromJson(v, emptyIsNull: emptyIsNull, growable: growable);
      });
    }
    return map;
  }
}

