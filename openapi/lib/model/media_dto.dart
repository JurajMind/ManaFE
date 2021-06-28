//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class MediaDto {
  /// Returns a new [MediaDto] instance.
  MediaDto({
    this.id,
    this.created,
    this.path,
    this.type,
    this.isDefault,
    this.extension_,
    this.fileName,
    this.sizes,
  });

  int id;

  DateTime created;

  String path;

  MediaDtoTypeEnum type;

  bool isDefault;

  String extension_;

  String fileName;

  String sizes;

  @override
  bool operator ==(Object other) => identical(this, other) || other is MediaDto &&
     other.id == id &&
     other.created == created &&
     other.path == path &&
     other.type == type &&
     other.isDefault == isDefault &&
     other.extension_ == extension_ &&
     other.fileName == fileName &&
     other.sizes == sizes;

  @override
  int get hashCode =>
    (id == null ? 0 : id.hashCode) +
    (created == null ? 0 : created.hashCode) +
    (path == null ? 0 : path.hashCode) +
    (type == null ? 0 : type.hashCode) +
    (isDefault == null ? 0 : isDefault.hashCode) +
    (extension_ == null ? 0 : extension_.hashCode) +
    (fileName == null ? 0 : fileName.hashCode) +
    (sizes == null ? 0 : sizes.hashCode);

  @override
  String toString() => 'MediaDto[id=$id, created=$created, path=$path, type=$type, isDefault=$isDefault, extension_=$extension_, fileName=$fileName, sizes=$sizes]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (id != null) {
      json[r'Id'] = id;
    }
    if (created != null) {
      json[r'Created'] = created.toUtc().toIso8601String();
    }
    if (path != null) {
      json[r'Path'] = path;
    }
    if (type != null) {
      json[r'Type'] = type;
    }
    if (isDefault != null) {
      json[r'IsDefault'] = isDefault;
    }
    if (extension_ != null) {
      json[r'Extension'] = extension_;
    }
    if (fileName != null) {
      json[r'FileName'] = fileName;
    }
    if (sizes != null) {
      json[r'Sizes'] = sizes;
    }
    return json;
  }

  /// Returns a new [MediaDto] instance and imports its values from
  /// [json] if it's non-null, null if [json] is null.
  static MediaDto fromJson(Map<String, dynamic> json) => json == null
    ? null
    : MediaDto(
        id: json[r'Id'],
        created: json[r'Created'] == null
          ? null
          : DateTime.parse(json[r'Created']),
        path: json[r'Path'],
        type: MediaDtoTypeEnum.fromJson(json[r'Type']),
        isDefault: json[r'IsDefault'],
        extension_: json[r'Extension'],
        fileName: json[r'FileName'],
        sizes: json[r'Sizes'],
    );

  static List<MediaDto> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <MediaDto>[]
      : json.map((v) => MediaDto.fromJson(v)).toList(growable: true == growable);

  static Map<String, MediaDto> mapFromJson(Map<String, dynamic> json) {
    final map = <String, MediaDto>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) => map[key] = MediaDto.fromJson(v));
    }
    return map;
  }

  // maps a json object with a list of MediaDto-objects as value to a dart map
  static Map<String, List<MediaDto>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<MediaDto>>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) {
        map[key] = MediaDto.listFromJson(v, emptyIsNull: emptyIsNull, growable: growable);
      });
    }
    return map;
  }
}


class MediaDtoTypeEnum {
  /// Instantiate a new enum with the provided [value].
  const MediaDtoTypeEnum._(this.value);

  /// The underlying value of this enum member.
  final int value;

  @override
  String toString() => value.toString();

  int toJson() => value;

  static const number0 = MediaDtoTypeEnum._(0);
  static const number1 = MediaDtoTypeEnum._(1);

  /// List of all possible values in this [enum][MediaDtoTypeEnum].
  static const values = <MediaDtoTypeEnum>[
    number0,
    number1,
  ];

  static MediaDtoTypeEnum fromJson(dynamic value) =>
    MediaDtoTypeEnumTypeTransformer().decode(value);

  static List<MediaDtoTypeEnum> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <MediaDtoTypeEnum>[]
      : json
          .map((value) => MediaDtoTypeEnum.fromJson(value))
          .toList(growable: true == growable);
}

/// Transformation class that can [encode] an instance of [MediaDtoTypeEnum] to int,
/// and [decode] dynamic data back to [MediaDtoTypeEnum].
class MediaDtoTypeEnumTypeTransformer {
  const MediaDtoTypeEnumTypeTransformer._();

  factory MediaDtoTypeEnumTypeTransformer() => _instance ??= MediaDtoTypeEnumTypeTransformer._();

  int encode(MediaDtoTypeEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a MediaDtoTypeEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  MediaDtoTypeEnum decode(dynamic data, {bool allowNull}) {
    switch (data) {
      case 0: return MediaDtoTypeEnum.number0;
      case 1: return MediaDtoTypeEnum.number1;
      default:
        if (allowNull == false) {
          throw ArgumentError('Unknown enum value to decode: $data');
        }
    }
    return null;
  }

  /// Singleton [MediaDtoTypeEnumTypeTransformer] instance.
  static MediaDtoTypeEnumTypeTransformer _instance;
}

