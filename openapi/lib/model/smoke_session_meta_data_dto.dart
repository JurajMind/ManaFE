//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class SmokeSessionMetaDataDto {
  /// Returns a new [SmokeSessionMetaDataDto] instance.
  SmokeSessionMetaDataDto({
    this.id,
    this.tobaccoId,
    this.tobacco,
    this.tobaccoMix,
    this.tobaccoWeight,
    this.anonymPeopleCount,
    this.bowlId,
    this.bowl,
    this.pipeId,
    this.pipe,
    this.coalId,
    this.coal,
    this.heatManagementId,
    this.heatManagement,
    this.packType,
    this.coalCount,
  });

  int id;

  int tobaccoId;

  PipeAccesorySimpleDto tobacco;

  TobaccoMixSimpleDto tobaccoMix;

  double tobaccoWeight;

  int anonymPeopleCount;

  int bowlId;

  PipeAccesorySimpleDto bowl;

  int pipeId;

  PipeAccesorySimpleDto pipe;

  int coalId;

  PipeAccesorySimpleDto coal;

  int heatManagementId;

  PipeAccesorySimpleDto heatManagement;

  SmokeSessionMetaDataDtoPackTypeEnum packType;

  double coalCount;

  @override
  bool operator ==(Object other) => identical(this, other) || other is SmokeSessionMetaDataDto &&
     other.id == id &&
     other.tobaccoId == tobaccoId &&
     other.tobacco == tobacco &&
     other.tobaccoMix == tobaccoMix &&
     other.tobaccoWeight == tobaccoWeight &&
     other.anonymPeopleCount == anonymPeopleCount &&
     other.bowlId == bowlId &&
     other.bowl == bowl &&
     other.pipeId == pipeId &&
     other.pipe == pipe &&
     other.coalId == coalId &&
     other.coal == coal &&
     other.heatManagementId == heatManagementId &&
     other.heatManagement == heatManagement &&
     other.packType == packType &&
     other.coalCount == coalCount;

  @override
  int get hashCode =>
    (id == null ? 0 : id.hashCode) +
    (tobaccoId == null ? 0 : tobaccoId.hashCode) +
    (tobacco == null ? 0 : tobacco.hashCode) +
    (tobaccoMix == null ? 0 : tobaccoMix.hashCode) +
    (tobaccoWeight == null ? 0 : tobaccoWeight.hashCode) +
    (anonymPeopleCount == null ? 0 : anonymPeopleCount.hashCode) +
    (bowlId == null ? 0 : bowlId.hashCode) +
    (bowl == null ? 0 : bowl.hashCode) +
    (pipeId == null ? 0 : pipeId.hashCode) +
    (pipe == null ? 0 : pipe.hashCode) +
    (coalId == null ? 0 : coalId.hashCode) +
    (coal == null ? 0 : coal.hashCode) +
    (heatManagementId == null ? 0 : heatManagementId.hashCode) +
    (heatManagement == null ? 0 : heatManagement.hashCode) +
    (packType == null ? 0 : packType.hashCode) +
    (coalCount == null ? 0 : coalCount.hashCode);

  @override
  String toString() => 'SmokeSessionMetaDataDto[id=$id, tobaccoId=$tobaccoId, tobacco=$tobacco, tobaccoMix=$tobaccoMix, tobaccoWeight=$tobaccoWeight, anonymPeopleCount=$anonymPeopleCount, bowlId=$bowlId, bowl=$bowl, pipeId=$pipeId, pipe=$pipe, coalId=$coalId, coal=$coal, heatManagementId=$heatManagementId, heatManagement=$heatManagement, packType=$packType, coalCount=$coalCount]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (id != null) {
      json[r'Id'] = id;
    }
    if (tobaccoId != null) {
      json[r'TobaccoId'] = tobaccoId;
    }
    if (tobacco != null) {
      json[r'Tobacco'] = tobacco;
    }
    if (tobaccoMix != null) {
      json[r'TobaccoMix'] = tobaccoMix;
    }
    if (tobaccoWeight != null) {
      json[r'TobaccoWeight'] = tobaccoWeight;
    }
    if (anonymPeopleCount != null) {
      json[r'AnonymPeopleCount'] = anonymPeopleCount;
    }
    if (bowlId != null) {
      json[r'BowlId'] = bowlId;
    }
    if (bowl != null) {
      json[r'Bowl'] = bowl;
    }
    if (pipeId != null) {
      json[r'PipeId'] = pipeId;
    }
    if (pipe != null) {
      json[r'Pipe'] = pipe;
    }
    if (coalId != null) {
      json[r'CoalId'] = coalId;
    }
    if (coal != null) {
      json[r'Coal'] = coal;
    }
    if (heatManagementId != null) {
      json[r'HeatManagementId'] = heatManagementId;
    }
    if (heatManagement != null) {
      json[r'HeatManagement'] = heatManagement;
    }
    if (packType != null) {
      json[r'PackType'] = packType;
    }
    if (coalCount != null) {
      json[r'CoalCount'] = coalCount;
    }
    return json;
  }

  /// Returns a new [SmokeSessionMetaDataDto] instance and imports its values from
  /// [json] if it's non-null, null if [json] is null.
  static SmokeSessionMetaDataDto fromJson(Map<String, dynamic> json) => json == null
    ? null
    : SmokeSessionMetaDataDto(
        id: json[r'Id'],
        tobaccoId: json[r'TobaccoId'],
        tobacco: PipeAccesorySimpleDto.fromJson(json[r'Tobacco']),
        tobaccoMix: TobaccoMixSimpleDto.fromJson(json[r'TobaccoMix']),
        tobaccoWeight: json[r'TobaccoWeight'],
        anonymPeopleCount: json[r'AnonymPeopleCount'],
        bowlId: json[r'BowlId'],
        bowl: PipeAccesorySimpleDto.fromJson(json[r'Bowl']),
        pipeId: json[r'PipeId'],
        pipe: PipeAccesorySimpleDto.fromJson(json[r'Pipe']),
        coalId: json[r'CoalId'],
        coal: PipeAccesorySimpleDto.fromJson(json[r'Coal']),
        heatManagementId: json[r'HeatManagementId'],
        heatManagement: PipeAccesorySimpleDto.fromJson(json[r'HeatManagement']),
        packType: SmokeSessionMetaDataDtoPackTypeEnum.fromJson(json[r'PackType']),
        coalCount: json[r'CoalCount'],
    );

  static List<SmokeSessionMetaDataDto> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <SmokeSessionMetaDataDto>[]
      : json.map((v) => SmokeSessionMetaDataDto.fromJson(v)).toList(growable: true == growable);

  static Map<String, SmokeSessionMetaDataDto> mapFromJson(Map<String, dynamic> json) {
    final map = <String, SmokeSessionMetaDataDto>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) => map[key] = SmokeSessionMetaDataDto.fromJson(v));
    }
    return map;
  }

  // maps a json object with a list of SmokeSessionMetaDataDto-objects as value to a dart map
  static Map<String, List<SmokeSessionMetaDataDto>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<SmokeSessionMetaDataDto>>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) {
        map[key] = SmokeSessionMetaDataDto.listFromJson(v, emptyIsNull: emptyIsNull, growable: growable);
      });
    }
    return map;
  }
}


class SmokeSessionMetaDataDtoPackTypeEnum {
  /// Instantiate a new enum with the provided [value].
  const SmokeSessionMetaDataDtoPackTypeEnum._(this.value);

  /// The underlying value of this enum member.
  final int value;

  @override
  String toString() => value.toString();

  int toJson() => value;

  static const number0 = SmokeSessionMetaDataDtoPackTypeEnum._(0);
  static const number1 = SmokeSessionMetaDataDtoPackTypeEnum._(1);
  static const number2 = SmokeSessionMetaDataDtoPackTypeEnum._(2);
  static const number3 = SmokeSessionMetaDataDtoPackTypeEnum._(3);
  static const number4 = SmokeSessionMetaDataDtoPackTypeEnum._(4);

  /// List of all possible values in this [enum][SmokeSessionMetaDataDtoPackTypeEnum].
  static const values = <SmokeSessionMetaDataDtoPackTypeEnum>[
    number0,
    number1,
    number2,
    number3,
    number4,
  ];

  static SmokeSessionMetaDataDtoPackTypeEnum fromJson(dynamic value) =>
    SmokeSessionMetaDataDtoPackTypeEnumTypeTransformer().decode(value);

  static List<SmokeSessionMetaDataDtoPackTypeEnum> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <SmokeSessionMetaDataDtoPackTypeEnum>[]
      : json
          .map((value) => SmokeSessionMetaDataDtoPackTypeEnum.fromJson(value))
          .toList(growable: true == growable);
}

/// Transformation class that can [encode] an instance of [SmokeSessionMetaDataDtoPackTypeEnum] to int,
/// and [decode] dynamic data back to [SmokeSessionMetaDataDtoPackTypeEnum].
class SmokeSessionMetaDataDtoPackTypeEnumTypeTransformer {
  const SmokeSessionMetaDataDtoPackTypeEnumTypeTransformer._();

  factory SmokeSessionMetaDataDtoPackTypeEnumTypeTransformer() => _instance ??= SmokeSessionMetaDataDtoPackTypeEnumTypeTransformer._();

  int encode(SmokeSessionMetaDataDtoPackTypeEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a SmokeSessionMetaDataDtoPackTypeEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  SmokeSessionMetaDataDtoPackTypeEnum decode(dynamic data, {bool allowNull}) {
    switch (data) {
      case 0: return SmokeSessionMetaDataDtoPackTypeEnum.number0;
      case 1: return SmokeSessionMetaDataDtoPackTypeEnum.number1;
      case 2: return SmokeSessionMetaDataDtoPackTypeEnum.number2;
      case 3: return SmokeSessionMetaDataDtoPackTypeEnum.number3;
      case 4: return SmokeSessionMetaDataDtoPackTypeEnum.number4;
      default:
        if (allowNull == false) {
          throw ArgumentError('Unknown enum value to decode: $data');
        }
    }
    return null;
  }

  /// Singleton [SmokeSessionMetaDataDtoPackTypeEnumTypeTransformer] instance.
  static SmokeSessionMetaDataDtoPackTypeEnumTypeTransformer _instance;
}

