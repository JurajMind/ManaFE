//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class SmartHookahModelsDbSessionDtoSessionPlaceReviewDto {
  /// Returns a new [SmartHookahModelsDbSessionDtoSessionPlaceReviewDto] instance.
  SmartHookahModelsDbSessionDtoSessionPlaceReviewDto({
    this.id,
    this.authorId,
    this.author,
    this.publishDate,
    this.tobaccoReview,
    this.medias = const [],
    this.smokeSessionId,
    this.smokeSession,
  });

  int id;

  int authorId;

  String author;

  DateTime publishDate;

  GearTobaccoReviewDto tobaccoReview;

  List<MediaDto> medias;

  int smokeSessionId;

  SmokeSessionSimpleDto smokeSession;

  @override
  bool operator ==(Object other) => identical(this, other) || other is SmartHookahModelsDbSessionDtoSessionPlaceReviewDto &&
     other.id == id &&
     other.authorId == authorId &&
     other.author == author &&
     other.publishDate == publishDate &&
     other.tobaccoReview == tobaccoReview &&
     other.medias == medias &&
     other.smokeSessionId == smokeSessionId &&
     other.smokeSession == smokeSession;

  @override
  int get hashCode =>
    (id == null ? 0 : id.hashCode) +
    (authorId == null ? 0 : authorId.hashCode) +
    (author == null ? 0 : author.hashCode) +
    (publishDate == null ? 0 : publishDate.hashCode) +
    (tobaccoReview == null ? 0 : tobaccoReview.hashCode) +
    (medias == null ? 0 : medias.hashCode) +
    (smokeSessionId == null ? 0 : smokeSessionId.hashCode) +
    (smokeSession == null ? 0 : smokeSession.hashCode);

  @override
  String toString() => 'SmartHookahModelsDbSessionDtoSessionPlaceReviewDto[id=$id, authorId=$authorId, author=$author, publishDate=$publishDate, tobaccoReview=$tobaccoReview, medias=$medias, smokeSessionId=$smokeSessionId, smokeSession=$smokeSession]';

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
    if (medias != null) {
      json[r'medias'] = medias;
    }
    if (smokeSessionId != null) {
      json[r'smokeSessionId'] = smokeSessionId;
    }
    if (smokeSession != null) {
      json[r'smokeSession'] = smokeSession;
    }
    return json;
  }

  /// Returns a new [SmartHookahModelsDbSessionDtoSessionPlaceReviewDto] instance and imports its values from
  /// [json] if it's non-null, null if [json] is null.
  static SmartHookahModelsDbSessionDtoSessionPlaceReviewDto fromJson(Map<String, dynamic> json) => json == null
    ? null
    : SmartHookahModelsDbSessionDtoSessionPlaceReviewDto(
        id: json[r'id'],
        authorId: json[r'authorId'],
        author: json[r'author'],
        publishDate: json[r'publishDate'] == null
          ? null
          : DateTime.parse(json[r'publishDate']),
        tobaccoReview: GearTobaccoReviewDto.fromJson(json[r'tobaccoReview']),
        medias: MediaDto.listFromJson(json[r'medias']),
        smokeSessionId: json[r'smokeSessionId'],
        smokeSession: SmokeSessionSimpleDto.fromJson(json[r'smokeSession']),
    );

  static List<SmartHookahModelsDbSessionDtoSessionPlaceReviewDto> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <SmartHookahModelsDbSessionDtoSessionPlaceReviewDto>[]
      : json.map((v) => SmartHookahModelsDbSessionDtoSessionPlaceReviewDto.fromJson(v)).toList(growable: true == growable);

  static Map<String, SmartHookahModelsDbSessionDtoSessionPlaceReviewDto> mapFromJson(Map<String, dynamic> json) {
    final map = <String, SmartHookahModelsDbSessionDtoSessionPlaceReviewDto>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) => map[key] = SmartHookahModelsDbSessionDtoSessionPlaceReviewDto.fromJson(v));
    }
    return map;
  }

  // maps a json object with a list of SmartHookahModelsDbSessionDtoSessionPlaceReviewDto-objects as value to a dart map
  static Map<String, List<SmartHookahModelsDbSessionDtoSessionPlaceReviewDto>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<SmartHookahModelsDbSessionDtoSessionPlaceReviewDto>>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) {
        map[key] = SmartHookahModelsDbSessionDtoSessionPlaceReviewDto.listFromJson(v, emptyIsNull: emptyIsNull, growable: growable);
      });
    }
    return map;
  }
}

