//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:openapi/src/model/smart_hookah_models_db_social_media.dart';
import 'package:openapi/src/model/media_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'feature_mix_creator_dto.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class FeatureMixCreatorDto {
  /// Returns a new [FeatureMixCreatorDto] instance.
  FeatureMixCreatorDto({

     this.name,

     this.description,

     this.location,

     this.socialMedias,

     this.medias,

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
    
    name: r'SocialMedias',
    required: false,
    includeIfNull: false
  )


  List<SmartHookahModelsDbSocialMedia>? socialMedias;



  @JsonKey(
    
    name: r'Medias',
    required: false,
    includeIfNull: false
  )


  List<MediaDto>? medias;



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
  bool operator ==(Object other) => identical(this, other) || other is FeatureMixCreatorDto &&
     other.name == name &&
     other.description == description &&
     other.location == location &&
     other.socialMedias == socialMedias &&
     other.medias == medias &&
     other.logoPicture == logoPicture &&
     other.personId == personId &&
     other.id == id;

  @override
  int get hashCode =>
    name.hashCode +
    description.hashCode +
    location.hashCode +
    socialMedias.hashCode +
    medias.hashCode +
    logoPicture.hashCode +
    personId.hashCode +
    id.hashCode;

  factory FeatureMixCreatorDto.fromJson(Map<String, dynamic> json) => _$FeatureMixCreatorDtoFromJson(json);

  Map<String, dynamic> toJson() => _$FeatureMixCreatorDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

