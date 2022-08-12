//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:json_annotation/json_annotation.dart';

part 'media_dto.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
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

  @JsonKey(
    
    name: r'Id',
    required: false,
    includeIfNull: false
  )


  int? id;



  @JsonKey(
    
    name: r'Created',
    required: false,
    includeIfNull: false
  )


  DateTime? created;



  @JsonKey(
    
    name: r'Path',
    required: false,
    includeIfNull: false
  )


  String? path;



  @JsonKey(
    
    name: r'Type',
    required: false,
    includeIfNull: false
  )


  MediaDtoTypeEnum? type;



  @JsonKey(
    
    name: r'IsDefault',
    required: false,
    includeIfNull: false
  )


  bool? isDefault;



  @JsonKey(
    
    name: r'Extension',
    required: false,
    includeIfNull: false
  )


  String? extension_;



  @JsonKey(
    
    name: r'FileName',
    required: false,
    includeIfNull: false
  )


  String? fileName;



  @JsonKey(
    
    name: r'Sizes',
    required: false,
    includeIfNull: false
  )


  String? sizes;



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
    id.hashCode +
    created.hashCode +
    path.hashCode +
    type.hashCode +
    isDefault.hashCode +
    extension_.hashCode +
    fileName.hashCode +
    sizes.hashCode;

  factory MediaDto.fromJson(Map<String, dynamic> json) => _$MediaDtoFromJson(json);

  Map<String, dynamic> toJson() => _$MediaDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}


enum MediaDtoTypeEnum {
  @JsonValue(0)
  number0,
  @JsonValue(1)
  number1,
}


