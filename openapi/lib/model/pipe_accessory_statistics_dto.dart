//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class PipeAccessoryStatisticsDto {
  /// Returns a new [PipeAccessoryStatisticsDto] instance.
  PipeAccessoryStatisticsDto({
    this.used,
    this.weight,
    this.pipeAccessoryId,
    this.smokeDurationTicks,
    this.pufCount,
    this.blowCount,
    this.sessionDurationTick,
    this.packType,
    this.cut,
    this.strength,
    this.duration,
    this.taste,
    this.smoke,
    this.overall,
    this.smokeTimePercentil,
    this.sessionTimePercentil,
  });

  int used;

  double weight;

  int pipeAccessoryId;

  int smokeDurationTicks;

  double pufCount;

  double blowCount;

  int sessionDurationTick;

  PipeAccessoryStatisticsDtoPackTypeEnum packType;

  double cut;

  double strength;

  double duration;

  double taste;

  double smoke;

  double overall;

  double smokeTimePercentil;

  double sessionTimePercentil;

  @override
  bool operator ==(Object other) => identical(this, other) || other is PipeAccessoryStatisticsDto &&
     other.used == used &&
     other.weight == weight &&
     other.pipeAccessoryId == pipeAccessoryId &&
     other.smokeDurationTicks == smokeDurationTicks &&
     other.pufCount == pufCount &&
     other.blowCount == blowCount &&
     other.sessionDurationTick == sessionDurationTick &&
     other.packType == packType &&
     other.cut == cut &&
     other.strength == strength &&
     other.duration == duration &&
     other.taste == taste &&
     other.smoke == smoke &&
     other.overall == overall &&
     other.smokeTimePercentil == smokeTimePercentil &&
     other.sessionTimePercentil == sessionTimePercentil;

  @override
  int get hashCode =>
    (used == null ? 0 : used.hashCode) +
    (weight == null ? 0 : weight.hashCode) +
    (pipeAccessoryId == null ? 0 : pipeAccessoryId.hashCode) +
    (smokeDurationTicks == null ? 0 : smokeDurationTicks.hashCode) +
    (pufCount == null ? 0 : pufCount.hashCode) +
    (blowCount == null ? 0 : blowCount.hashCode) +
    (sessionDurationTick == null ? 0 : sessionDurationTick.hashCode) +
    (packType == null ? 0 : packType.hashCode) +
    (cut == null ? 0 : cut.hashCode) +
    (strength == null ? 0 : strength.hashCode) +
    (duration == null ? 0 : duration.hashCode) +
    (taste == null ? 0 : taste.hashCode) +
    (smoke == null ? 0 : smoke.hashCode) +
    (overall == null ? 0 : overall.hashCode) +
    (smokeTimePercentil == null ? 0 : smokeTimePercentil.hashCode) +
    (sessionTimePercentil == null ? 0 : sessionTimePercentil.hashCode);

  @override
  String toString() => 'PipeAccessoryStatisticsDto[used=$used, weight=$weight, pipeAccessoryId=$pipeAccessoryId, smokeDurationTicks=$smokeDurationTicks, pufCount=$pufCount, blowCount=$blowCount, sessionDurationTick=$sessionDurationTick, packType=$packType, cut=$cut, strength=$strength, duration=$duration, taste=$taste, smoke=$smoke, overall=$overall, smokeTimePercentil=$smokeTimePercentil, sessionTimePercentil=$sessionTimePercentil]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (used != null) {
      json[r'Used'] = used;
    }
    if (weight != null) {
      json[r'Weight'] = weight;
    }
    if (pipeAccessoryId != null) {
      json[r'PipeAccessoryId'] = pipeAccessoryId;
    }
    if (smokeDurationTicks != null) {
      json[r'SmokeDurationTicks'] = smokeDurationTicks;
    }
    if (pufCount != null) {
      json[r'PufCount'] = pufCount;
    }
    if (blowCount != null) {
      json[r'BlowCount'] = blowCount;
    }
    if (sessionDurationTick != null) {
      json[r'SessionDurationTick'] = sessionDurationTick;
    }
    if (packType != null) {
      json[r'PackType'] = packType;
    }
    if (cut != null) {
      json[r'Cut'] = cut;
    }
    if (strength != null) {
      json[r'Strength'] = strength;
    }
    if (duration != null) {
      json[r'Duration'] = duration;
    }
    if (taste != null) {
      json[r'Taste'] = taste;
    }
    if (smoke != null) {
      json[r'Smoke'] = smoke;
    }
    if (overall != null) {
      json[r'Overall'] = overall;
    }
    if (smokeTimePercentil != null) {
      json[r'SmokeTimePercentil'] = smokeTimePercentil;
    }
    if (sessionTimePercentil != null) {
      json[r'SessionTimePercentil'] = sessionTimePercentil;
    }
    return json;
  }

  /// Returns a new [PipeAccessoryStatisticsDto] instance and imports its values from
  /// [json] if it's non-null, null if [json] is null.
  static PipeAccessoryStatisticsDto fromJson(Map<String, dynamic> json) => json == null
    ? null
    : PipeAccessoryStatisticsDto(
        used: json[r'Used'],
        weight: json[r'Weight'],
        pipeAccessoryId: json[r'PipeAccessoryId'],
        smokeDurationTicks: json[r'SmokeDurationTicks'],
        pufCount: json[r'PufCount'],
        blowCount: json[r'BlowCount'],
        sessionDurationTick: json[r'SessionDurationTick'],
        packType: PipeAccessoryStatisticsDtoPackTypeEnum.fromJson(json[r'PackType']),
        cut: json[r'Cut'],
        strength: json[r'Strength'],
        duration: json[r'Duration'],
        taste: json[r'Taste'],
        smoke: json[r'Smoke'],
        overall: json[r'Overall'],
        smokeTimePercentil: json[r'SmokeTimePercentil'],
        sessionTimePercentil: json[r'SessionTimePercentil'],
    );

  static List<PipeAccessoryStatisticsDto> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <PipeAccessoryStatisticsDto>[]
      : json.map((v) => PipeAccessoryStatisticsDto.fromJson(v)).toList(growable: true == growable);

  static Map<String, PipeAccessoryStatisticsDto> mapFromJson(Map<String, dynamic> json) {
    final map = <String, PipeAccessoryStatisticsDto>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) => map[key] = PipeAccessoryStatisticsDto.fromJson(v));
    }
    return map;
  }

  // maps a json object with a list of PipeAccessoryStatisticsDto-objects as value to a dart map
  static Map<String, List<PipeAccessoryStatisticsDto>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<PipeAccessoryStatisticsDto>>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) {
        map[key] = PipeAccessoryStatisticsDto.listFromJson(v, emptyIsNull: emptyIsNull, growable: growable);
      });
    }
    return map;
  }
}


class PipeAccessoryStatisticsDtoPackTypeEnum {
  /// Instantiate a new enum with the provided [value].
  const PipeAccessoryStatisticsDtoPackTypeEnum._(this.value);

  /// The underlying value of this enum member.
  final int value;

  @override
  String toString() => value.toString();

  int toJson() => value;

  static const number0 = PipeAccessoryStatisticsDtoPackTypeEnum._(0);
  static const number1 = PipeAccessoryStatisticsDtoPackTypeEnum._(1);
  static const number2 = PipeAccessoryStatisticsDtoPackTypeEnum._(2);
  static const number3 = PipeAccessoryStatisticsDtoPackTypeEnum._(3);
  static const number4 = PipeAccessoryStatisticsDtoPackTypeEnum._(4);

  /// List of all possible values in this [enum][PipeAccessoryStatisticsDtoPackTypeEnum].
  static const values = <PipeAccessoryStatisticsDtoPackTypeEnum>[
    number0,
    number1,
    number2,
    number3,
    number4,
  ];

  static PipeAccessoryStatisticsDtoPackTypeEnum fromJson(dynamic value) =>
    PipeAccessoryStatisticsDtoPackTypeEnumTypeTransformer().decode(value);

  static List<PipeAccessoryStatisticsDtoPackTypeEnum> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <PipeAccessoryStatisticsDtoPackTypeEnum>[]
      : json
          .map((value) => PipeAccessoryStatisticsDtoPackTypeEnum.fromJson(value))
          .toList(growable: true == growable);
}

/// Transformation class that can [encode] an instance of [PipeAccessoryStatisticsDtoPackTypeEnum] to int,
/// and [decode] dynamic data back to [PipeAccessoryStatisticsDtoPackTypeEnum].
class PipeAccessoryStatisticsDtoPackTypeEnumTypeTransformer {
  const PipeAccessoryStatisticsDtoPackTypeEnumTypeTransformer._();

  factory PipeAccessoryStatisticsDtoPackTypeEnumTypeTransformer() => _instance ??= PipeAccessoryStatisticsDtoPackTypeEnumTypeTransformer._();

  int encode(PipeAccessoryStatisticsDtoPackTypeEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a PipeAccessoryStatisticsDtoPackTypeEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  PipeAccessoryStatisticsDtoPackTypeEnum decode(dynamic data, {bool allowNull}) {
    switch (data) {
      case 0: return PipeAccessoryStatisticsDtoPackTypeEnum.number0;
      case 1: return PipeAccessoryStatisticsDtoPackTypeEnum.number1;
      case 2: return PipeAccessoryStatisticsDtoPackTypeEnum.number2;
      case 3: return PipeAccessoryStatisticsDtoPackTypeEnum.number3;
      case 4: return PipeAccessoryStatisticsDtoPackTypeEnum.number4;
      default:
        if (allowNull == false) {
          throw ArgumentError('Unknown enum value to decode: $data');
        }
    }
    return null;
  }

  /// Singleton [PipeAccessoryStatisticsDtoPackTypeEnumTypeTransformer] instance.
  static PipeAccessoryStatisticsDtoPackTypeEnumTypeTransformer _instance;
}

