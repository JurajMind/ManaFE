//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:json_annotation/json_annotation.dart';

part 'feature_mix_creator_simple_dto.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class FeatureMixCreatorSimpleDto {
  /// Returns a new [FeatureMixCreatorSimpleDto] instance.
  FeatureMixCreatorSimpleDto({

     this.name,

     this.description,

     this.location,

     this.logoPicture,

     this.personId,

     this.id,
  });

  @JsonKey(
    
    name: r'Name',
    required: false,
    includeIfNull: false
  )


  String? name;



  @JsonKey(
    
    name: r'Description',
    required: false,
    includeIfNull: false
  )


  String? description;



  @JsonKey(
    
    name: r'Location',
    required: false,
    includeIfNull: false
  )


  String? location;



  @JsonKey(
    
    name: r'LogoPicture',
    required: false,
    includeIfNull: false
  )


  String? logoPicture;



  @JsonKey(
    
    name: r'PersonId',
    required: false,
    includeIfNull: false
  )


  int? personId;



  @JsonKey(
    
    name: r'Id',
    required: false,
    includeIfNull: false
  )


  int? id;



  @override
  bool operator ==(Object other) => identical(this, other) || other is FeatureMixCreatorSimpleDto &&
     other.name == name &&
     other.description == description &&
     other.location == location &&
     other.logoPicture == logoPicture &&
     other.personId == personId &&
     other.id == id;

  @override
  int get hashCode =>
    name.hashCode +
    description.hashCode +
    location.hashCode +
    logoPicture.hashCode +
    personId.hashCode +
    id.hashCode;

  factory FeatureMixCreatorSimpleDto.fromJson(Map<String, dynamic> json) => _$FeatureMixCreatorSimpleDtoFromJson(json);

  Map<String, dynamic> toJson() => _$FeatureMixCreatorSimpleDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

