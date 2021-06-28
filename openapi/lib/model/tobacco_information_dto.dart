//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class TobaccoInformationDto {
  /// Returns a new [TobaccoInformationDto] instance.
  TobaccoInformationDto({
    this.tobacco,
    this.tobaccoTastes = const [],
    this.personTobaccoStats,
    this.allTobaccoStats,
    this.smokeSessions = const [],
    this.reviews = const [],
  });

  TobaccoSimpleDto tobacco;

  List<TobaccoTasteDto> tobaccoTastes;

  PipeAccessoryStatisticsDto personTobaccoStats;

  PipeAccessoryStatisticsDto allTobaccoStats;

  List<SmokeSessionSimpleDto> smokeSessions;

  List<GearTobaccoReviewDto> reviews;

  @override
  bool operator ==(Object other) => identical(this, other) || other is TobaccoInformationDto &&
     other.tobacco == tobacco &&
     other.tobaccoTastes == tobaccoTastes &&
     other.personTobaccoStats == personTobaccoStats &&
     other.allTobaccoStats == allTobaccoStats &&
     other.smokeSessions == smokeSessions &&
     other.reviews == reviews;

  @override
  int get hashCode =>
    (tobacco == null ? 0 : tobacco.hashCode) +
    (tobaccoTastes == null ? 0 : tobaccoTastes.hashCode) +
    (personTobaccoStats == null ? 0 : personTobaccoStats.hashCode) +
    (allTobaccoStats == null ? 0 : allTobaccoStats.hashCode) +
    (smokeSessions == null ? 0 : smokeSessions.hashCode) +
    (reviews == null ? 0 : reviews.hashCode);

  @override
  String toString() => 'TobaccoInformationDto[tobacco=$tobacco, tobaccoTastes=$tobaccoTastes, personTobaccoStats=$personTobaccoStats, allTobaccoStats=$allTobaccoStats, smokeSessions=$smokeSessions, reviews=$reviews]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (tobacco != null) {
      json[r'Tobacco'] = tobacco;
    }
    if (tobaccoTastes != null) {
      json[r'TobaccoTastes'] = tobaccoTastes;
    }
    if (personTobaccoStats != null) {
      json[r'PersonTobaccoStats'] = personTobaccoStats;
    }
    if (allTobaccoStats != null) {
      json[r'AllTobaccoStats'] = allTobaccoStats;
    }
    if (smokeSessions != null) {
      json[r'SmokeSessions'] = smokeSessions;
    }
    if (reviews != null) {
      json[r'Reviews'] = reviews;
    }
    return json;
  }

  /// Returns a new [TobaccoInformationDto] instance and imports its values from
  /// [json] if it's non-null, null if [json] is null.
  static TobaccoInformationDto fromJson(Map<String, dynamic> json) => json == null
    ? null
    : TobaccoInformationDto(
        tobacco: TobaccoSimpleDto.fromJson(json[r'Tobacco']),
        tobaccoTastes: TobaccoTasteDto.listFromJson(json[r'TobaccoTastes']),
        personTobaccoStats: PipeAccessoryStatisticsDto.fromJson(json[r'PersonTobaccoStats']),
        allTobaccoStats: PipeAccessoryStatisticsDto.fromJson(json[r'AllTobaccoStats']),
        smokeSessions: SmokeSessionSimpleDto.listFromJson(json[r'SmokeSessions']),
        reviews: GearTobaccoReviewDto.listFromJson(json[r'Reviews']),
    );

  static List<TobaccoInformationDto> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <TobaccoInformationDto>[]
      : json.map((v) => TobaccoInformationDto.fromJson(v)).toList(growable: true == growable);

  static Map<String, TobaccoInformationDto> mapFromJson(Map<String, dynamic> json) {
    final map = <String, TobaccoInformationDto>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) => map[key] = TobaccoInformationDto.fromJson(v));
    }
    return map;
  }

  // maps a json object with a list of TobaccoInformationDto-objects as value to a dart map
  static Map<String, List<TobaccoInformationDto>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<TobaccoInformationDto>>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) {
        map[key] = TobaccoInformationDto.listFromJson(v, emptyIsNull: emptyIsNull, growable: growable);
      });
    }
    return map;
  }
}

