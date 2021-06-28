//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class PlacesPlaceReviewDto {
  /// Returns a new [PlacesPlaceReviewDto] instance.
  PlacesPlaceReviewDto({
    this.id,
    this.authorId,
    this.author,
    this.publishDate,
    this.text,
    this.service,
    this.ambience,
    this.overall,
    this.placeId,
    this.sessionReview,
    this.medias = const [],
  });

  int id;

  int authorId;

  String author;

  DateTime publishDate;

  String text;

  int service;

  int ambience;

  int overall;

  int placeId;

  SmartHookahModelsDbSessionDtoSessionPlaceReviewDto sessionReview;

  List<MediaDto> medias;

  @override
  bool operator ==(Object other) => identical(this, other) || other is PlacesPlaceReviewDto &&
     other.id == id &&
     other.authorId == authorId &&
     other.author == author &&
     other.publishDate == publishDate &&
     other.text == text &&
     other.service == service &&
     other.ambience == ambience &&
     other.overall == overall &&
     other.placeId == placeId &&
     other.sessionReview == sessionReview &&
     other.medias == medias;

  @override
  int get hashCode =>
    (id == null ? 0 : id.hashCode) +
    (authorId == null ? 0 : authorId.hashCode) +
    (author == null ? 0 : author.hashCode) +
    (publishDate == null ? 0 : publishDate.hashCode) +
    (text == null ? 0 : text.hashCode) +
    (service == null ? 0 : service.hashCode) +
    (ambience == null ? 0 : ambience.hashCode) +
    (overall == null ? 0 : overall.hashCode) +
    (placeId == null ? 0 : placeId.hashCode) +
    (sessionReview == null ? 0 : sessionReview.hashCode) +
    (medias == null ? 0 : medias.hashCode);

  @override
  String toString() => 'PlacesPlaceReviewDto[id=$id, authorId=$authorId, author=$author, publishDate=$publishDate, text=$text, service=$service, ambience=$ambience, overall=$overall, placeId=$placeId, sessionReview=$sessionReview, medias=$medias]';

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
    if (text != null) {
      json[r'text'] = text;
    }
    if (service != null) {
      json[r'service'] = service;
    }
    if (ambience != null) {
      json[r'ambience'] = ambience;
    }
    if (overall != null) {
      json[r'overall'] = overall;
    }
    if (placeId != null) {
      json[r'placeId'] = placeId;
    }
    if (sessionReview != null) {
      json[r'sessionReview'] = sessionReview;
    }
    if (medias != null) {
      json[r'medias'] = medias;
    }
    return json;
  }

  /// Returns a new [PlacesPlaceReviewDto] instance and imports its values from
  /// [json] if it's non-null, null if [json] is null.
  static PlacesPlaceReviewDto fromJson(Map<String, dynamic> json) => json == null
    ? null
    : PlacesPlaceReviewDto(
        id: json[r'id'],
        authorId: json[r'authorId'],
        author: json[r'author'],
        publishDate: json[r'publishDate'] == null
          ? null
          : DateTime.parse(json[r'publishDate']),
        text: json[r'text'],
        service: json[r'service'],
        ambience: json[r'ambience'],
        overall: json[r'overall'],
        placeId: json[r'placeId'],
        sessionReview: SmartHookahModelsDbSessionDtoSessionPlaceReviewDto.fromJson(json[r'sessionReview']),
        medias: MediaDto.listFromJson(json[r'medias']),
    );

  static List<PlacesPlaceReviewDto> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <PlacesPlaceReviewDto>[]
      : json.map((v) => PlacesPlaceReviewDto.fromJson(v)).toList(growable: true == growable);

  static Map<String, PlacesPlaceReviewDto> mapFromJson(Map<String, dynamic> json) {
    final map = <String, PlacesPlaceReviewDto>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) => map[key] = PlacesPlaceReviewDto.fromJson(v));
    }
    return map;
  }

  // maps a json object with a list of PlacesPlaceReviewDto-objects as value to a dart map
  static Map<String, List<PlacesPlaceReviewDto>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<PlacesPlaceReviewDto>>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) {
        map[key] = PlacesPlaceReviewDto.listFromJson(v, emptyIsNull: emptyIsNull, growable: growable);
      });
    }
    return map;
  }
}

