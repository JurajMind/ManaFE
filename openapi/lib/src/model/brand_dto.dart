//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:openapi/src/model/smart_hookah_models_db_social_media.dart';
import 'package:openapi/src/model/media_dto.dart';
import 'package:openapi/src/model/pipe_accesory_simple_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'brand_dto.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class BrandDto {
  /// Returns a new [BrandDto] instance.
  BrandDto({

     this.name,

     this.url,

     this.picture,

     this.tobacco,

     this.bowl,

     this.hookah,

     this.coal,

     this.heatManagment,

     this.tobaccoMixBrand,

     this.pipeAccessories,

     this.socialMedias,

     this.medias,

     this.displayName,
  });

  @JsonKey(
    
    name: r'Name',
    required: false,
    includeIfNull: false
  )


  String? name;



  @JsonKey(
    
    name: r'Url',
    required: false,
    includeIfNull: false
  )


  String? url;



  @JsonKey(
    
    name: r'Picture',
    required: false,
    includeIfNull: false
  )


  String? picture;



  @JsonKey(
    
    name: r'Tobacco',
    required: false,
    includeIfNull: false
  )


  bool? tobacco;



  @JsonKey(
    
    name: r'Bowl',
    required: false,
    includeIfNull: false
  )


  bool? bowl;



  @JsonKey(
    
    name: r'Hookah',
    required: false,
    includeIfNull: false
  )


  bool? hookah;



  @JsonKey(
    
    name: r'Coal',
    required: false,
    includeIfNull: false
  )


  bool? coal;



  @JsonKey(
    
    name: r'HeatManagment',
    required: false,
    includeIfNull: false
  )


  bool? heatManagment;



  @JsonKey(
    
    name: r'TobaccoMixBrand',
    required: false,
    includeIfNull: false
  )


  bool? tobaccoMixBrand;



  @JsonKey(
    
    name: r'PipeAccessories',
    required: false,
    includeIfNull: false
  )


  List<PipeAccesorySimpleDto>? pipeAccessories;



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
    
    name: r'DisplayName',
    required: false,
    includeIfNull: false
  )


  String? displayName;



  @override
  bool operator ==(Object other) => identical(this, other) || other is BrandDto &&
     other.name == name &&
     other.url == url &&
     other.picture == picture &&
     other.tobacco == tobacco &&
     other.bowl == bowl &&
     other.hookah == hookah &&
     other.coal == coal &&
     other.heatManagment == heatManagment &&
     other.tobaccoMixBrand == tobaccoMixBrand &&
     other.pipeAccessories == pipeAccessories &&
     other.socialMedias == socialMedias &&
     other.medias == medias &&
     other.displayName == displayName;

  @override
  int get hashCode =>
    name.hashCode +
    url.hashCode +
    picture.hashCode +
    tobacco.hashCode +
    bowl.hashCode +
    hookah.hashCode +
    coal.hashCode +
    heatManagment.hashCode +
    tobaccoMixBrand.hashCode +
    pipeAccessories.hashCode +
    socialMedias.hashCode +
    medias.hashCode +
    displayName.hashCode;

  factory BrandDto.fromJson(Map<String, dynamic> json) => _$BrandDtoFromJson(json);

  Map<String, dynamic> toJson() => _$BrandDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

