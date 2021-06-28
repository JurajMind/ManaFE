//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class GearTobaccoReviewDto {
  /// Returns a new [GearTobaccoReviewDto] instance.
  GearTobaccoReviewDto({
    this.id,
    this.cut,
    this.taste,
    this.smoke,
    this.strength,
    this.duration,
    this.overall,
    this.text,
    this.smokeSessionId,
    this.sessionReviewId,
    this.medias = const [],
  });

  int id;

  int cut;

  int taste;

  int smoke;

  int strength;

  int duration;

  double overall;

  String text;

  int smokeSessionId;

  int sessionReviewId;

  List<MediaDto> medias;

  @override
  bool operator ==(Object other) => identical(this, other) || other is GearTobaccoReviewDto &&
     other.id == id &&
     other.cut == cut &&
     other.taste == taste &&
     other.smoke == smoke &&
     other.strength == strength &&
     other.duration == duration &&
     other.overall == overall &&
     other.text == text &&
     other.smokeSessionId == smokeSessionId &&
     other.sessionReviewId == sessionReviewId &&
     other.medias == medias;

  @override
  int get hashCode =>
    (id == null ? 0 : id.hashCode) +
    (cut == null ? 0 : cut.hashCode) +
    (taste == null ? 0 : taste.hashCode) +
    (smoke == null ? 0 : smoke.hashCode) +
    (strength == null ? 0 : strength.hashCode) +
    (duration == null ? 0 : duration.hashCode) +
    (overall == null ? 0 : overall.hashCode) +
    (text == null ? 0 : text.hashCode) +
    (smokeSessionId == null ? 0 : smokeSessionId.hashCode) +
    (sessionReviewId == null ? 0 : sessionReviewId.hashCode) +
    (medias == null ? 0 : medias.hashCode);

  @override
  String toString() => 'GearTobaccoReviewDto[id=$id, cut=$cut, taste=$taste, smoke=$smoke, strength=$strength, duration=$duration, overall=$overall, text=$text, smokeSessionId=$smokeSessionId, sessionReviewId=$sessionReviewId, medias=$medias]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (id != null) {
      json[r'Id'] = id;
    }
    if (cut != null) {
      json[r'Cut'] = cut;
    }
    if (taste != null) {
      json[r'Taste'] = taste;
    }
    if (smoke != null) {
      json[r'Smoke'] = smoke;
    }
    if (strength != null) {
      json[r'Strength'] = strength;
    }
    if (duration != null) {
      json[r'Duration'] = duration;
    }
    if (overall != null) {
      json[r'Overall'] = overall;
    }
    if (text != null) {
      json[r'Text'] = text;
    }
    if (smokeSessionId != null) {
      json[r'SmokeSessionId'] = smokeSessionId;
    }
    if (sessionReviewId != null) {
      json[r'SessionReviewId'] = sessionReviewId;
    }
    if (medias != null) {
      json[r'Medias'] = medias;
    }
    return json;
  }

  /// Returns a new [GearTobaccoReviewDto] instance and imports its values from
  /// [json] if it's non-null, null if [json] is null.
  static GearTobaccoReviewDto fromJson(Map<String, dynamic> json) => json == null
    ? null
    : GearTobaccoReviewDto(
        id: json[r'Id'],
        cut: json[r'Cut'],
        taste: json[r'Taste'],
        smoke: json[r'Smoke'],
        strength: json[r'Strength'],
        duration: json[r'Duration'],
        overall: json[r'Overall'],
        text: json[r'Text'],
        smokeSessionId: json[r'SmokeSessionId'],
        sessionReviewId: json[r'SessionReviewId'],
        medias: MediaDto.listFromJson(json[r'Medias']),
    );

  static List<GearTobaccoReviewDto> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <GearTobaccoReviewDto>[]
      : json.map((v) => GearTobaccoReviewDto.fromJson(v)).toList(growable: true == growable);

  static Map<String, GearTobaccoReviewDto> mapFromJson(Map<String, dynamic> json) {
    final map = <String, GearTobaccoReviewDto>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) => map[key] = GearTobaccoReviewDto.fromJson(v));
    }
    return map;
  }

  // maps a json object with a list of GearTobaccoReviewDto-objects as value to a dart map
  static Map<String, List<GearTobaccoReviewDto>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<GearTobaccoReviewDto>>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) {
        map[key] = GearTobaccoReviewDto.listFromJson(v, emptyIsNull: emptyIsNull, growable: growable);
      });
    }
    return map;
  }
}

