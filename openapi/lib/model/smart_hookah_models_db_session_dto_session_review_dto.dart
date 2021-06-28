//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class SmartHookahModelsDbSessionDtoSessionReviewDto {
  /// Returns a new [SmartHookahModelsDbSessionDtoSessionReviewDto] instance.
  SmartHookahModelsDbSessionDtoSessionReviewDto({
    this.id,
    this.authorId,
    this.author,
    this.publishDate,
    this.tobaccoReview,
    this.placeReviewId,
    this.placeReview,
    this.medias = const [],
    this.smokeSessionId,
    this.taste,
    this.smoke,
    this.strength,
    this.duration,
    this.smokeSession,
  });

  int id;

  int authorId;

  String author;

  DateTime publishDate;

  GearTobaccoReviewDto tobaccoReview;

  int placeReviewId;

  PlacesPlaceReviewDto placeReview;

  List<MediaDto> medias;

  int smokeSessionId;

  int taste;

  int smoke;

  int strength;

  int duration;

  SmokeSessionSimpleDto smokeSession;

  @override
  bool operator ==(Object other) => identical(this, other) || other is SmartHookahModelsDbSessionDtoSessionReviewDto &&
     other.id == id &&
     other.authorId == authorId &&
     other.author == author &&
     other.publishDate == publishDate &&
     other.tobaccoReview == tobaccoReview &&
     other.placeReviewId == placeReviewId &&
     other.placeReview == placeReview &&
     other.medias == medias &&
     other.smokeSessionId == smokeSessionId &&
     other.taste == taste &&
     other.smoke == smoke &&
     other.strength == strength &&
     other.duration == duration &&
     other.smokeSession == smokeSession;

  @override
  int get hashCode =>
    (id == null ? 0 : id.hashCode) +
    (authorId == null ? 0 : authorId.hashCode) +
    (author == null ? 0 : author.hashCode) +
    (publishDate == null ? 0 : publishDate.hashCode) +
    (tobaccoReview == null ? 0 : tobaccoReview.hashCode) +
    (placeReviewId == null ? 0 : placeReviewId.hashCode) +
    (placeReview == null ? 0 : placeReview.hashCode) +
    (medias == null ? 0 : medias.hashCode) +
    (smokeSessionId == null ? 0 : smokeSessionId.hashCode) +
    (taste == null ? 0 : taste.hashCode) +
    (smoke == null ? 0 : smoke.hashCode) +
    (strength == null ? 0 : strength.hashCode) +
    (duration == null ? 0 : duration.hashCode) +
    (smokeSession == null ? 0 : smokeSession.hashCode);

  @override
  String toString() => 'SmartHookahModelsDbSessionDtoSessionReviewDto[id=$id, authorId=$authorId, author=$author, publishDate=$publishDate, tobaccoReview=$tobaccoReview, placeReviewId=$placeReviewId, placeReview=$placeReview, medias=$medias, smokeSessionId=$smokeSessionId, taste=$taste, smoke=$smoke, strength=$strength, duration=$duration, smokeSession=$smokeSession]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (id != null) {
      json[r'id'] = id;
    }
    if (authorId != null) {
      json[r'authorId'] = authorId;
    }
    if (author != null) {
      json[r'author'] = author;
    }
    if (publishDate != null) {
      json[r'publishDate'] = publishDate.toUtc().toIso8601String();
    }
    if (tobaccoReview != null) {
      json[r'tobaccoReview'] = tobaccoReview;
    }
    if (placeReviewId != null) {
      json[r'placeReviewId'] = placeReviewId;
    }
    if (placeReview != null) {
      json[r'placeReview'] = placeReview;
    }
    if (medias != null) {
      json[r'medias'] = medias;
    }
    if (smokeSessionId != null) {
      json[r'smokeSessionId'] = smokeSessionId;
    }
    if (taste != null) {
      json[r'taste'] = taste;
    }
    if (smoke != null) {
      json[r'smoke'] = smoke;
    }
    if (strength != null) {
      json[r'strength'] = strength;
    }
    if (duration != null) {
      json[r'duration'] = duration;
    }
    if (smokeSession != null) {
      json[r'smokeSession'] = smokeSession;
    }
    return json;
  }

  /// Returns a new [SmartHookahModelsDbSessionDtoSessionReviewDto] instance and imports its values from
  /// [json] if it's non-null, null if [json] is null.
  static SmartHookahModelsDbSessionDtoSessionReviewDto fromJson(Map<String, dynamic> json) => json == null
    ? null
    : SmartHookahModelsDbSessionDtoSessionReviewDto(
        id: json[r'id'],
        authorId: json[r'authorId'],
        author: json[r'author'],
        publishDate: json[r'publishDate'] == null
          ? null
          : DateTime.parse(json[r'publishDate']),
        tobaccoReview: GearTobaccoReviewDto.fromJson(json[r'tobaccoReview']),
        placeReviewId: json[r'placeReviewId'],
        placeReview: PlacesPlaceReviewDto.fromJson(json[r'placeReview']),
        medias: MediaDto.listFromJson(json[r'medias']),
        smokeSessionId: json[r'smokeSessionId'],
        taste: json[r'taste'],
        smoke: json[r'smoke'],
        strength: json[r'strength'],
        duration: json[r'duration'],
        smokeSession: SmokeSessionSimpleDto.fromJson(json[r'smokeSession']),
    );

  static List<SmartHookahModelsDbSessionDtoSessionReviewDto> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <SmartHookahModelsDbSessionDtoSessionReviewDto>[]
      : json.map((v) => SmartHookahModelsDbSessionDtoSessionReviewDto.fromJson(v)).toList(growable: true == growable);

  static Map<String, SmartHookahModelsDbSessionDtoSessionReviewDto> mapFromJson(Map<String, dynamic> json) {
    final map = <String, SmartHookahModelsDbSessionDtoSessionReviewDto>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) => map[key] = SmartHookahModelsDbSessionDtoSessionReviewDto.fromJson(v));
    }
    return map;
  }

  // maps a json object with a list of SmartHookahModelsDbSessionDtoSessionReviewDto-objects as value to a dart map
  static Map<String, List<SmartHookahModelsDbSessionDtoSessionReviewDto>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<SmartHookahModelsDbSessionDtoSessionReviewDto>>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) {
        map[key] = SmartHookahModelsDbSessionDtoSessionReviewDto.listFromJson(v, emptyIsNull: emptyIsNull, growable: growable);
      });
    }
    return map;
  }
}

