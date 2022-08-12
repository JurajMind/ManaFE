//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:json_annotation/json_annotation.dart';

part 'brand_group_dto.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class BrandGroupDto {
  /// Returns a new [BrandGroupDto] instance.
  BrandGroupDto({

     this.id,

     this.picture,

     this.name,

     this.itemCount,
  });

  @JsonKey(
    
    name: r'Id',
    required: false,
    includeIfNull: false
  )


  String? id;



  @JsonKey(
    
    name: r'Picture',
    required: false,
    includeIfNull: false
  )


  String? picture;



  @JsonKey(
    
    name: r'Name',
    required: false,
    includeIfNull: false
  )


  String? name;



  @JsonKey(
    
    name: r'ItemCount',
    required: false,
    includeIfNull: false
  )


  int? itemCount;



  @override
  bool operator ==(Object other) => identical(this, other) || other is BrandGroupDto &&
     other.id == id &&
     other.picture == picture &&
     other.name == name &&
     other.itemCount == itemCount;

  @override
  int get hashCode =>
    id.hashCode +
    picture.hashCode +
    name.hashCode +
    itemCount.hashCode;

  factory BrandGroupDto.fromJson(Map<String, dynamic> json) => _$BrandGroupDtoFromJson(json);

  Map<String, dynamic> toJson() => _$BrandGroupDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

